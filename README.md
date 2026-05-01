<p align="center">
  <img src="src/assets/logo.svg" alt="OpenSnipping" width="80" height="80">
</p>

<h1 align="center">OpenSnipping</h1>

<p align="center">
  <strong>The Windows Snipping Tool, in your browser. 100% private.</strong><br>
  Capture, annotate, and screen-record — no installs, no uploads, no signup.<br>
  Pure HTML/CSS/JavaScript. No frameworks, no build step, no telemetry.
</p>

<p align="center">
  <a href="https://yummyjars.com/opensnipping/"><strong>Live demo →</strong></a>
  &nbsp;·&nbsp;
  <a href="#-self-host">Self-host</a>
  &nbsp;·&nbsp;
  <a href="CONTRIBUTING.md">Contribute</a>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <img src="https://img.shields.io/badge/dependencies-0-brightgreen.svg" alt="Zero runtime dependencies">
  <img src="https://img.shields.io/badge/build-no--build-orange.svg" alt="No build step">
  <img src="https://img.shields.io/badge/privacy-100%25%20local-success.svg" alt="100% local">
</p>

---

## ✨ Features

- **Screenshot anywhere** — capture full screen, a window, or a browser tab
  via the browser's native screen-share picker.
- **Crop** — drag to select a region; crop and re-crop freely.
- **Annotate** — pen + rectangle (outlined or filled), 6-color palette,
  3 stroke widths, eraser, undo/redo.
- **Screen record** — capture video with optional microphone, preview, and
  trim before saving (WebM with VP9 + Opus).
- **Paste & drop** — paste images directly from the clipboard or drop them
  in to annotate existing screenshots.
- **Save or copy** — copy to clipboard (PNG) or save to file. Optional
  "Save before snip" workflow.
- **Capture delay** — 1–5 second timer for menus and tooltips that
  disappear on click.
- **Keyboard friendly** — common shortcuts (see below).
- **Installable** — works as a PWA on supported browsers.

## 🔒 Privacy

OpenSnipping runs **entirely in your browser**. Captured images, recordings,
and annotations are processed locally and **never leave your device**.

- ❌ No backend
- ❌ No analytics or telemetry
- ❌ No signup, no email, no cookies
- ❌ No third-party requests — every script and asset is served from
  the same origin as the page. The only runtime helper,
  [`fix-webm-duration`](https://github.com/yusitnikov/fix-webm-duration)
  (~14 KB), is vendored at [`src/lib/fix-webm-duration.min.js`](src/lib/fix-webm-duration.min.js).
  You can verify in DevTools → Network that no cross-origin requests are made.

[Read the security policy →](SECURITY.md)

## 🌐 Browser support

Tested on the latest two versions of:

| Browser | Capture | Recording | Clipboard copy | Save File Picker |
|---|---|---|---|---|
| Chrome / Edge / Brave / Opera | ✅ | ✅ | ✅ | ✅ |
| Firefox | ✅ | ✅ | ⚠️ falls back to download | ❌ falls back to download |
| Safari (desktop) | ⚠️ window only | ⚠️ best-effort | ⚠️ Web Share fallback | ❌ falls back to download |
| Mobile browsers | ❌ — no `getDisplayMedia` | | | |

> **HTTPS required** for screen capture and Clipboard APIs. `http://localhost`
> works for local dev. Self-hosting on a remote domain requires a TLS
> certificate.

## ⌨️ Keyboard shortcuts

| Key | Action |
|---|---|
| `Esc` | Exit crop / annotation / video preview (with confirmation) |
| `I` | (Trim mode) Set in-point at current playhead |
| `O` | (Trim mode) Set out-point at current playhead |
| `Space` | (Trim mode) Play / pause trimmed section |

## 🏠 Self-host

OpenSnipping is **just static files**. No build step, no Node, no Docker
required. Pick whichever option you like:

### Option 1 — Run locally (fastest)

```bash
git clone https://github.com/b1tank/opensnipping-web.git
cd opensnipping-web
./scripts/serve.sh                # http://localhost:8765
# or any of:
python3 -m http.server 8765
npx serve .
php -S localhost:8765
```

Open `http://localhost:8765/` in any modern browser.

### Option 2 — GitHub Pages

```text
Settings → Pages → Source: deploy from main branch, / (root)
```

Your fork goes live at `https://<you>.github.io/opensnipping-web/`.

### Option 3 — Vercel / Netlify / Cloudflare Pages

Connect your fork; no build settings needed.

| Setting | Value |
|---|---|
| Build command | *(leave empty)* |
| Output directory | `.` (repo root) |

### Option 4 — Any static host (S3, nginx, Caddy, …)

```bash
rsync -av --exclude='.git' --exclude='scripts' --exclude='.github' \
  --exclude='*.md' --exclude='.gitignore' \
  ./ user@host:/var/www/opensnipping/
```

The only files you actually need to serve:

```
index.html
manifest.json
src/
```

### Notes for self-hosters

- **HTTPS is mandatory** in production. `getDisplayMedia` and the Clipboard
  API only work on secure origins (or `http://localhost`).
- The site is a single HTML page; no routing or rewrites needed.
- The logo in the top-left links to `../` by default. If you don't want
  that link, edit [`index.html`](index.html) and remove the surrounding
  `<a class="logo-link">` tag, or point it at your homepage.
- Screen recording uses VP9; encoding happens entirely on the user's
  machine.

## 🛠️ Project layout

```
index.html           # Entry point
manifest.json        # PWA manifest
src/
  app.js             # All app logic
  style.css          # All styles
  assets/            # Logos
  lib/i18n.js        # Tiny i18n helper
scripts/             # Maintainer-only deploy + local serve helpers
.github/workflows/   # Auto-deploy to maintainer's demo on push
```

No bundler, no transpiler, no `node_modules`. Edit any file and reload.

## 🤝 Contributing

PRs welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Adding bundlers,
backends, or telemetry is a non-goal.

## 📜 License

[MIT](LICENSE) © 2026 Zhichao Li
