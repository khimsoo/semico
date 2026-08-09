#!/bin/bash
set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO="https://github.com/khimsoo/semico.git"

echo "📁 Working from: $SITE_DIR"
cd "$SITE_DIR"

# Init git if not already
if [ ! -d ".git" ]; then
  git init
  echo "✅ Git initialised"
fi

# Set remote
if git remote get-url origin &>/dev/null; then
  git remote set-url origin "$REPO"
else
  git remote add origin "$REPO"
fi
echo "✅ Remote set to $REPO"

# Stage & commit
git add .
git commit -m "Deploy SemiCo website" 2>/dev/null || echo "ℹ️  Nothing new to commit"

# Push
git branch -M main
echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main --force

echo ""
echo "✅ Done! Visit: https://github.com/khimsoo/semico"
