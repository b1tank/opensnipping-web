#!/bin/bash
# ============================================================================
# Maintainer-only convenience script.
#
# Deploys OpenSnipping to a private instance. External contributors
# do not need this; see README.md → "Self-host".
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
TARGET="${YUMMYJARS_LAN_URL:?YUMMYJARS_LAN_URL not set}"

echo "📦 Deploying $SLUG to $TARGET..."
tar czf - \
  --exclude='.git' \
  --exclude='.env' \
  --exclude='.env.*' \
  --exclude='scripts' \
  --exclude='.github' \
  --exclude='.playwright-mcp' \
  . | curl -sSf -X POST \
    -H "X-API-Key: ${YUMMYJARS_KEY:?YUMMYJARS_KEY not set}" \
    -H "Content-Type: application/gzip" \
    --data-binary @- \
    "$TARGET/api/deploy/$SLUG"

echo ""
echo "✅ Deployed to $TARGET/$SLUG/"
