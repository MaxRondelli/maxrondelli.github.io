# Computes a "last updated" date for a page from the files its content comes from.
#
# In a page's front matter, list those files (paths or globs, relative to the site root):
#
#   last_modified_from:
#     - _bibliography/papers.bib
#     - _projects/*.md
#
# The page's own file is always included. The page then gets `page.last_modified` (a Time), which
# _includes/last_modified.liquid prints. The date is the most recent git commit touching any of the
# files; files with uncommitted changes (e.g. while editing locally) count as modified now. Without
# git history, file modification times are used instead.
#
# The deploy workflow must check out the full history (actions/checkout with fetch-depth: 0),
# otherwise every file looks modified in the latest commit.

require "open3"
require "time"

module LastModified
  module_function

  def files_for(site, page)
    patterns = Array(page.data["last_modified_from"]) + [page.relative_path]
    patterns.flat_map { |pattern| Dir.glob(File.join(site.source, pattern)) }
            .select { |path| File.file?(path) }
            .uniq
  end

  def git(site, *args)
    out, status = Open3.capture2("git", "-C", site.source, *args, err: File::NULL)
    status.success? ? out.strip : nil
  rescue SystemCallError
    nil
  end

  def date_for(site, files)
    return nil if files.empty?

    relative = files.map { |path| path.delete_prefix("#{site.source}/") }
    committed = git(site, "log", "-1", "--format=%cI", "--", *relative)
    dirty = git(site, "status", "--porcelain", "--", *relative)

    if committed.nil?
      files.map { |path| File.mtime(path) }.max
    elsif dirty && !dirty.empty?
      Time.now
    elsif !committed.empty?
      Time.iso8601(committed)
    else
      files.map { |path| File.mtime(path) }.max # files not committed yet
    end
  end
end

# Runs after the site is read and before anything is rendered, so the value is visible to Liquid.
Jekyll::Hooks.register :site, :post_read do |site|
  site.pages.each do |page|
    next unless page.data.key?("last_modified_from")

    page.data["last_modified"] = LastModified.date_for(site, LastModified.files_for(site, page))
  end
end
