#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_dir"

exec Rscript -e 'sandpaper::serve(".", host = "0.0.0.0", port = 4321, browser = FALSE, daemon = FALSE, quiet = FALSE)'
