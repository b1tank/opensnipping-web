#!/bin/bash
# Deploy OpenSnipping to YummyJars platform (public)
# Usage: YUMMYJARS_KEY=<key> ./deploy.sh

set -euo pipefail

SLUG="opensnipping"
TARGET="${YUMMYJARS_URL:-https://yummyjars.com}"

echo "📦 Deploying $SLUG to $TARGET..."
tar czf - \
  --exclude='.git' \
  --exclude='deploy.sh' \
  --exclude='deploy-lan.sh' \
  --exclude='.github' \
  --exclude='TODO.md' \
  --exclude='video-plan.md' \
  . | curl -sSf -X POST \
    -H "X-API-Key: ${YUMMYJARS_KEY:?YUMMYJARS_KEY not set}" \
    -H "Content-Type: application/gzip" \
    --data-binary @- \
    "$TARGET/api/deploy/$SLUG"

echo ""
echo "✅ Deployed to $TARGET/$SLUG/"
