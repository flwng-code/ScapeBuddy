# Security and privacy

This repository is public. Fill this in honestly and date it; it is checked as
part of grading.

**Last checked:** 2026-10-09

## What this app stores

| Data | Where it lives | Who can see it |
| --- | --- | --- |
| e.g. the user's task list | on the device (shared_preferences) | only that user |

DATA:
USERS NOTES
USERS LOADOUTS

WHERE IT LIVES:
THE USER'S DEVICE (DATA LOCALLY STORED USING SQLITE)

WHO CAN SEE IT:
ONLY THE USER CAN SEE THEIR OWN DATA THAT THEY PLACED INTO THE APP


## Secrets

- Values my app needs at run time: _(list the names, not the values)_
- Where they live locally: `.env`, which is git-ignored
- Where the deploy workflow gets them: repository secrets (Settings > Secrets
  and variables > Actions; the walkthrough is on page 12 of
  `content/extending-your-app/` in your workspace)
- Anything my deployed web build carries that a visitor could read, and why that
  is acceptable: _(a Supabase anon key protected by RLS, a Firebase config
  protected by rules, or nothing)_

## What protects the data on the service side

- Firestore rules / Supabase RLS policies: _(paste or summarize them; "test mode"
  is not an answer)_
- If nothing leaves the device, say that instead.

nothing leaves the device, the application and code do not use firestore or supabase.

## Checklist

- [X] `.env` (or `env.json`) is in `.gitignore`, and `.env.example` is committed
- [X] `git log -p | grep -i "api_key\|secret\|password\|token"` finds nothing real
- [X] No service account file, keystore or `service_role` key anywhere in the repo
- [X] Security rules or RLS policies written and tested, not left open
- [X] No real personal data in sample data, screenshots or the video
- [X] No course or university credentials anywhere
- [X] Anyone whose data appears in a test was asked first

If you found and revoked a key while doing this, say so here. Catching it is the
right outcome, not an embarrassment.
