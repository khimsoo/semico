#!/bin/bash
# Run this from Terminal to push the image updates to GitHub
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR"

# Clear any stale lock files
rm -f .git/index.lock .git/refs/heads/main.lock .git/HEAD.lock .git/packed-refs.lock 2>/dev/null || true

# Stage updated files
git add equipment.html style.css img/

# Check if there's anything new
if git diff --cached --quiet; then
  echo "Nothing new to commit."
  exit 0
fi

git commit -m "Add equipment photos and updated layout"
git push origin main
echo ""
echo "✅ Done! Visit: https://khimsoo.github.io/semico/equipment.html"
