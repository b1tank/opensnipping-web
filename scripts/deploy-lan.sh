#!/bin/bash
# ============================================================================
# Maintainer-only convenience script.
#
# Deploys OpenSnipping to the maintainer's LAN-only YummyJars instance.
# This is unreachable from GitHub Actions, so there's no CI equivalent.
# External contributors do not need this; see README.md → "Self-host".
#
# Usage (from repo root):
#   set -a && source .env.lan && set +a && ./scripts/deploy-lan.sh
# ============================================================================
set -euo pipefail

# Resolve repo root regardless of where the script is invoked from.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

SLUG="opensnipping"
TARGET="${YUMMYJARS_LAN_URL:-https://my.yummyjars.com}"

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
