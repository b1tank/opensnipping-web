# OpenSnipping Video Recording - 1 Hour Sprint

## Goal
Record screen + mic → preview → simple trim → save WebM for Slack.

---

## Step 1: Recording UI (~10 min)
- [x] Add Record button to toolbar
- [x] Add recording timer (MM:SS)
- [x] Basic CSS for recording state

## Step 2: Recording Logic (~15 min)
- [x] `startRecording()` - get screen + mic streams, init MediaRecorder
- [x] `stopRecording()` - stop and collect blob
- [x] Wire up Record button click

## Step 3: Preview & Save (~15 min)
- [x] Show `<video>` player after recording stops
- [x] Play/pause + seek bar
- [x] Save button → download WebM
- [x] Discard button → reset

## Step 4: Trim UI (~15 min)
- [x] Add Trim button to toolbar (enters trim mode)
- [x] Add trim bar with draggable start/end handles
- [x] Set In/Out buttons + keyboard shortcuts (I/O)
- [x] Play/Pause within trim range
- [x] Apply/Cancel buttons in trim mode
- [x] Reset Trim button

## Step 5: Actual Trim Export (Not Implemented)
- [ ] FFmpeg.wasm integration for actual video trimming
- [ ] Save trimmed video instead of full video
- **Note:** Currently trim is preview-only. Saving always saves the full video.

---

## Future: FFmpeg.wasm Implementation Notes
If we want to actually export trimmed videos:
- Library: `@ffmpeg/ffmpeg` via CDN (lazy-load)
- Requires COOP/COEP headers (`Cross-Origin-Opener-Policy: same-origin`, `Cross-Origin-Embedder-Policy: require-corp`)
- Command: `ffmpeg -ss [start] -i input.webm -t [duration] -c copy output.webm`
- The `-c copy` flag = no re-encoding = fast!
