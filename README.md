# Final Project

Copy this into your workspace `project/README.md` and fill it in.

## My project repository

Public repository: https://github.com/flwng-code/ScapeBuddy

Live app (if deployed): https://...

## What it is

ScapeBuddy is a RuneScape companion with a boss bestiary, a four-slot gear
builder, and milestone notes.

Notes and saved gear loadouts are stored locally in SQLite. On Chrome, the
database stays in browser storage associated with the current site origin. It is
not shared across devices or browser profiles, and clearing the site's browser
data removes it. Native builds keep the database in the app's local documents
folder.

## How to run it

From this folder, run:

```bash
flutter pub get
flutter run -d chrome
```

The gear images used in the Build Maker live in `assets/images/builds/`.
The checked-in SQLite WebAssembly file and Drift worker in `web/` are needed
for Chrome and the deployed web app.

## Presentation

- Video (public Google Drive link): https://drive.google.com/drive/folders/1LDIOvDWGHjwtbqTOrxDwxUjudKETJlKt?usp=sharing
- Slides (link or PDF): https://...
- Square image: in this folder, or a link.  

## AI usage

Link to the `AI-USAGE.md` in my project repository:
https://github.com/flwng-code/ScapeBuddy/blob/main/AI-USAGE.md
