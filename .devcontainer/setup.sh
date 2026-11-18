#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

Rscript -e 'for (pkg in c("sandpaper", "pegboard", "varnish", "servr")) {
  if (!requireNamespace(pkg, quietly = TRUE)) stop("Missing Workbench package: ", pkg)
}
cat("Workbench packages are ready.\n")'

if [[ -d renv ]]; then
  Rscript /home/rstudio/.workbench/setup_lesson_deps.R
  Rscript /home/rstudio/.workbench/fortify_renv_cache.R
fi

printf '\nStart the course preview with:\n  bash .devcontainer/preview.sh\n'
