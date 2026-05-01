# Contributing to OpenSnipping Web

Thanks for your interest! OpenSnipping aims to stay tiny, dependency-free, and
privacy-first. Contributions that align with those values are very welcome.

## Quick start

OpenSnipping is pure static HTML/CSS/JS — no build step, no package manager.

```bash
git clone https://github.com/b1tank/opensnipping-web.git
cd opensnipping-web
./scripts/serve.sh           # serves on http://localhost:8765
# or:  python3 -m http.server 8765
```

Open `http://localhost:8765/` in any modern browser.

## Project layout

```
index.html        # Single page UI
style.css         # All styles
app.js            # All logic (capture, annotate, record, save)
lib/i18n.js       # Tiny i18n helper
logo*.svg         # Branding
manifest.json     # PWA manifest
scripts/          # Maintainer-only helpers (deploy, serve)
.github/          # CI workflows + templates
```

## Guidelines

- **No build step.** Adding bundlers/transpilers/frameworks is a non-goal.
- **No backend.** All processing must happen in the browser.
- **No telemetry, no remote calls.** Even for "anonymous" analytics. Privacy is
  the product.
- **Cross-browser.** Test in at least latest Chrome and Firefox before opening
  a PR. Safari is best-effort (Clipboard API gaps are documented).
- **Keep dependencies tiny.** The only external script today is
  `fix-webm-duration` (CDN, ~3 KB) for VLC-compatible recordings. New
  dependencies need a strong justification.
- **Match the existing style.** Tabs, no semicolons-skipping, single-quotes.
  Don't reformat unrelated code.

## Reporting bugs

See [issue templates](.github/ISSUE_TEMPLATE/). Please include:

- Browser + version
- Steps to reproduce
- Expected vs actual behaviour
- Console errors (open DevTools first)

## Pull requests

1. Fork, branch from `main`.
2. Make focused commits — one feature/fix per PR.
3. Run a manual smoke test (capture → annotate → save) before opening.
4. Describe the user-visible change and any tradeoffs.

## Testing

There's a Playwright suite under `tests/` (run `npm test`). See
`tests/README.md` for details. Adding tests for new behaviour is appreciated
but not required for small fixes.

## License

By contributing you agree your work is released under the MIT License.
