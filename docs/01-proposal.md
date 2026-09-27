# ScapeBuddy project proposal and roadmap

The submitted proposal is available at [assets/proposal-revised.pdf](assets/proposal-revised.pdf).
This Markdown copy summarizes its scope and tracks implementation decisions.

## The problem, in one sentence

MMO players need one place to check boss information, plan equipment, and keep
track of personal milestones while playing.

## Who it is for

Players of the MMO named in the submitted proposal who want a lightweight
companion on a phone or browser. The application should be understandable to
players who want to quickly check a guide or their own planning notes.

## Core features

1. Email and password account access.
2. A shared, read-only bestiary with boss information and strategies.
3. Personal gear builds or loadouts.
4. Personal milestone notes, with reminders as a later extension.

The mockup includes a login screen, home screen, bestiary list and details,
build screen, and notes screen. The current runnable implementation is only a
static home draft. Group chat was mentioned as an example of a possible feature
in an earlier request, but it is absent from this proposal and mockup, so it is
outside the current scope.

## Out of scope, and why

- Group chat, AI helpers, and patch notes are not in the revised proposal.
- Reminder delivery is deferred until a suitable platform flow is selected.
- A custom server is not planned for the first version; Firebase is the planned
  account and private-data service.

## Data the app remembers, and where it is saved

The proposal plans Firebase Authentication for account access and Cloud
Firestore for user-owned builds and notes. Each user's records must be tied to
that account. Bestiary content is shared and read-only, and can be packaged as
local application data. The app does not currently sign users in or save data.

## Risks

- Firestore rules must prevent one account from reading or changing another
  account's private notes and builds.
- Network failures must not make the app appear to save changes that were lost.
- The proposal calls for 12 gear slots, while the mockup depicts 11. Keep that
  decision open until the screen and data model are reviewed together.
- The written design-system notes say dark mode, while the provided screens use
  pale surfaces with black bars. The visual mockup is the current screen-level
  reference.
- The supplied template targets web. Mobile builds may need platform folders
  regenerated if they are required for the final submission.

## Changes since the last version

- The supplied course template is now the repository structure. The static
  home screen and project documents have been adapted to it.
- The three home cards remain icon-free, following the student's earlier UI
  direction. Their text remains placeholder copy for now.
- Template files do not establish a new feature requirement; the revised
  proposal and mockup continue to define the app scope.

## Roadmap checkpoints

Checked items record only the work already done. Later features remain for the
student to build in stages.

### 0. Read and record the source material - complete

- [x] Read the revised proposal, mockup, and design-system PDFs.
- [x] Record the feature scope, screen flow, design tokens, and open conflicts.
- [x] Keep the original PDFs in `docs/assets/` for future reference.

### 1. Fit the project to the supplied template - complete

- [x] Use the template's web-focused Flutter structure and DevicePreview setup.
- [x] Keep the README, template docs, workflow, environment example, and ignore rules.
- [x] Retain the three icon-free home cards and placeholder descriptions.
- [x] Remove unused feature stubs and platform scaffolds absent from the template.
- [ ] Confirm whether native mobile builds will be needed later.

### 2. Static screen draft - started

- [x] Keep a runnable app entry point and initial home screen.
- [ ] Replace the temporary card descriptions with final copy.
- [ ] Refine shared colors, type, and spacing against the mockup.
- [ ] Add the remaining screen layouts at the 390 x 844 design size.
- [ ] Add bottom navigation and screen transitions.

### 3. Shared bestiary - not started

- [ ] Define a boss data model and local sample data.
- [ ] Build the list and boss-detail layouts shown in the mockup.
- [ ] Add loading, empty, missing-image, and long-description states where needed.

### 4. Build creator - not started

- [ ] Define gear and loadout models.
- [ ] Build the gear slots and gear picker.
- [ ] Resolve the proposal's 12 slots versus the mockup's 11 visible slots.
- [ ] Add naming, create, edit, and save flows.

### 5. Milestones and notes - not started

- [ ] Decide how milestone tracking extends the mockup's simple note editor.
- [ ] Add create, edit, delete, and updated-time behavior.
- [ ] Decide whether reminders are needed and which platforms they support.

### 6. Accounts and cloud data - not started

- [ ] Configure Firebase for the required target platforms.
- [ ] Add email and password authentication.
- [ ] Scope each user's builds and notes to their authenticated ID.
- [ ] Write and test Firestore rules before storing user data.
- [ ] Keep shared bestiary records separate from private user records.

### 7. Connectivity and save feedback - not started

- [ ] Show loading, success, and error feedback for sign-in and saves.
- [ ] Decide what users can read or edit when offline.
- [ ] Make failed saves visible so a note or loadout is not silently lost.

### 8. Responsive behavior and accessibility - not started

- [ ] Compare each screen with the 390 x 844 mockup.
- [ ] Review narrow and wide browser sizes and text scaling.
- [ ] Check labels, keyboard focus, contrast, and tap target sizes.

### 9. Project verification - not started

- [ ] Add tests as features are implemented and verify them during development.
- [ ] Run static analysis and build for each agreed target.
- [ ] Verify sign-in, private-data separation, and Firestore rules with test users.
- [ ] Capture current screenshots and record remaining limitations.

### 10. Final handoff - not started

- [ ] Update setup instructions after Firebase configuration exists.
- [ ] Write weekly reports during the project rather than reconstructing them later.
- [ ] Prepare a demo around the proposal's core user journey.
- [ ] Review privacy, screenshots, and security rules before submission.

Current work completes checkpoints 0 and 1 and starts checkpoint 2. The rest of
the product is intentionally unfinished. Update the boxes and decisions as each
stage is completed.
