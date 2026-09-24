# maxrondelli.github.io

Personal academic website, built with [al-folio](https://github.com/alshedivat/al-folio) (Jekyll) and deployed to GitHub Pages.

## Where to edit things

| What | File |
| --- | --- |
| Name, site URL, feature flags | `_config.yml` |
| Bio, affiliation, photo | `_pages/about.md`, `assets/img/prof_pic.jpg` |
| Social / academic links | `_data/socials.yml` |
| Publications | `_bibliography/papers.bib` (+ `_data/venues.yml`, `_data/coauthors.yml`) |
| News | `_news/*.md` |
| Projects | `_projects/*.md` |
| CV | `assets/pdf/MassimoRondelli-cv.pdf` (copy the new PDF over it) |
| Teaching | `_teachings/*.md` |
| Blog posts | `_posts/YYYY-MM-DD-title.md` (enable `nav` in `_pages/blog.md`) |

Search for `TODO` to find remaining placeholders.

## Deployment

Pushing to `main` runs `.github/workflows/deploy.yml`, which builds the site and pushes it to the `gh-pages` branch.
One-time setup on GitHub:

1. **Settings → Actions → General → Workflow permissions** → *Read and write permissions*.
2. After the first successful run: **Settings → Pages → Build and deployment** → *Deploy from a branch* → `gh-pages` / `(root)`.

## Local development (Docker)

```sh
docker compose up -d        # start the dev server -> http://localhost:8080
docker compose logs -f      # follow the build output / errors
docker compose down         # stop it
docker compose up -d --build  # after changing Gemfile / Gemfile.lock
```

Saving any file rebuilds the site in a few seconds and the open browser tab reloads by itself.
Edits to `_config.yml` restart Jekyll automatically (~10 s). Installed gems are cached in the `bundle` volume, so restarts are fast.

Without Docker (Ruby 3.3 + Bundler): `bundle install && bundle exec jekyll serve --livereload`, then open <http://localhost:4000>.

See `docs/` for the full al-folio documentation.
