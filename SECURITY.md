# Security Policy

OpenSnipping runs entirely in the user's browser. Captured images, recordings,
and annotations are processed locally and never leave the device. No backend,
no analytics, no telemetry.

## Reporting a vulnerability

If you find a security issue (e.g. XSS, accidental data exfiltration via a CDN
script, prototype pollution, supply-chain risk), please **do not** open a
public issue.

Instead, email **b1tank at outlook dot com** with:

- A description of the issue and its impact
- Steps to reproduce
- Affected browser/version (if relevant)

You'll get an acknowledgement within 72 hours. Disclosure timeline is
coordinated case-by-case but typically 90 days.

## Scope

In scope:

- The static app served from this repository
- The vendored third-party script (`src/lib/fix-webm-duration.min.js`)
- Browser permission misuse (camera/mic/screen)

Out of scope:

- Issues in the user's browser engine (report to vendor)
- Issues in operating-system clipboard / screen-capture surfaces
- The maintainer's hosted demo at `yummyjars.com/opensnipping/` infrastructure
  (report separately if relevant)
