# Security and privacy

**Last checked:** 2026-09-26

This is a public-repository-safe description of the current draft and planned
data flow. It should be reviewed again when Firebase is configured.

## What this app stores

| Data | Where it lives now | Planned access |
| --- | --- | --- |
| Account details | Nowhere; sign-in is not implemented | Firebase Authentication |
| Builds and notes | Nowhere; persistence is not implemented | Firestore records owned by the signed-in user |
| Bestiary guide content | Nowhere in the current draft | Shared, read-only app content |

The current screen collects no personal data and makes no network requests.
Screenshots and sample data should not contain real personal information.

## Secrets and configuration

- The current app has no environment variables and does not need a `.env` file.
- `.env.example` is retained from the template as a reminder, but contains no
  real credentials and defines no variables consumed by this app.
- Firebase configuration may be included in a client app only as project
  identifiers intended for client use. Firestore rules, not hiding those
  identifiers, must protect user data.
- Never put a service-account key, private API key, or privileged server
  credential in Dart code, a web build, or a public repository.
- The deploy workflow does not currently consume credentials.

## What protects the data on the service side

No backend is configured, so no personal data leaves the device at this stage.
Before the app stores user data, add and test Firestore rules that restrict
builds and notes to their owner's authenticated user ID. Keep the shared
bestiary separate from those private records.

## Checklist

- [x] `.env` is ignored and `.env.example` contains no real values.
- [x] No Firebase service-account file is part of the project.
- [ ] Review repository history for accidentally committed credentials before
      making the project public.
- [ ] Write and test Firestore rules before storing user data.
- [ ] Confirm that future sample content, screenshots, and video contain no
      real personal information.
- [ ] Keep course or university credentials out of this repository.
- [ ] Ask permission before including another person's data in a test.
