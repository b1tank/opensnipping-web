#!/bin/bash
# Serve OpenSnipping locally on http://localhost:8765
# OpenSnipping is pure static HTML/CSS/JS, so any static server works.
# This script is just a zero-dependency convenience wrapper.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

PORT="${PORT:-8765}"

echo "🌐 Serving OpenSnipping on http://localhost:$PORT"
echo "   (Ctrl+C to stop)"
exec python3 -m http.server "$PORT"
