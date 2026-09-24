#!/bin/bash
set -euo pipefail

echo "Entry point script running"

CONFIG_FILE=_config.yml
DOCKER_DESTINATION=/tmp/_site

# Keep Gemfile.lock as-is: it pins the al-folio gem versions this site was set up with.
# Discard any rewrite bundler made inside the container so the host copy stays the source of truth.
manage_gemfile_lock() {
    git config --global --add safe.directory /srv/jekyll
    if git ls-files --error-unmatch Gemfile.lock &> /dev/null; then
        git restore Gemfile.lock 2>/dev/null || true
    fi
}

ensure_bundle_deps() {
    if bundle check >/dev/null 2>&1; then
        echo "Bundler dependencies already satisfied"
        return
    fi

    echo "Installing missing bundler dependencies"
    bundle install --jobs 4 --retry 3
}

start_jekyll() {
    manage_gemfile_lock
    ensure_bundle_deps
    mkdir -p "$DOCKER_DESTINATION"
    bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --trace --force_polling --destination "$DOCKER_DESTINATION" --config "$CONFIG_FILE" &
}

start_jekyll

# Jekyll does not reload _config.yml on its own, so restart it when the file changes.
# Polls the mtime because inotify events do not propagate through Windows/macOS bind mounts.
last_mtime=$(stat -c %Y "$CONFIG_FILE")
while true; do
    sleep 2
    mtime=$(stat -c %Y "$CONFIG_FILE" 2>/dev/null || echo "$last_mtime")
    if [ "$mtime" != "$last_mtime" ]; then
        last_mtime=$mtime
        echo "Change detected to $CONFIG_FILE, restarting Jekyll"
        pkill -KILL -f "jekyll serve" || true
        sleep 1
        start_jekyll
    fi
done
