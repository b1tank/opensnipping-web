#!/bin/bash
# ============================================================================
# Maintainer-only convenience script.
#
# OpenSnipping is a pure static HTML/CSS/JS app. To self-host, just serve the
# repo root with any static file server (see README.md → "Self-host"). You do
# NOT need this script.
#
# This script deploys to the maintainer's YummyJars instance. Production
# deployment is also automated via .github/workflows/deploy.yml on push to
# main, so this script is only useful for fast iteration outside of CI.
#
# Usage (from repo root):
#   set -a && source .env && set +a && ./scripts/deploy-prod.sh
# ============================================================================
set -euo pipefail

# Resolve repo root regardless of where the script is invoked from.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

SLUG="opensnipping"
TARGET="${YUMMYJARS_URL:-https://yummyjars.com}"

echo "📦 Deploying $SLUG to $TARGET..."
tar czf - \
  --exclude='.git' \
  --exclude='.env' \
  --exclude='.env.*' \
  --exclude='scripts' \
  --exclude='tests' \
  --exclude='.github' \
  --exclude='TODO.md' \
  --exclude='video-plan.md' \
  --exclude='LAUNCH.md' \
  --exclude='.playwright-mcp' \
  . | curl -sSf -X POST \
    -H "X-API-Key: ${YUMMYJARS_KEY:?YUMMYJARS_KEY not set}" \
    -H "Content-Type: application/gzip" \
    --data-binary @- \
    "$TARGET/api/deploy/$SLUG"

echo ""
echo "✅ Deployed to $TARGET/$SLUG/"
