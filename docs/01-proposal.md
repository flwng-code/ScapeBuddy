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

1. A shared, read-only bestiary with boss information and strategies.
2. Personal gear builds or loadouts.
3. Personal milestone notes, with reminders as a later extension.

The current flow starts directly on Home and continues to the Bestiary, Builds,
or Milestone Notes. The submitted mockup includes a login screen, but the
student has removed account access from the project scope. The current runnable
implementation has image-led home cards and early destination screen drafts.
Group chat was mentioned as an example of a possible feature in an earlier
request, but it is outside the current scope.

## Out of scope, and why

- Authentication, Firebase, Firestore, and cloud sync are out of scope.
- Group chat, AI helpers, and patch notes are also outside the project scope.
- Reminder delivery is deferred until a suitable platform flow is selected.

## Data the app remembers, and where it is saved

The app has no user accounts or remote backend. Bestiary content is shared and
read-only, and can be packaged as local application data. The current build and
notes screens do not save data yet. When persistence is implemented, builds and
notes are expected to stay on the user's current device or browser profile;
there will be no account-based sync unless the project scope changes.

## Risks

- Locally stored notes and builds may be lost if the user clears browser or app
  data, changes devices, or uninstalls the app. The storage and backup behavior
  should be explained before persistence is added.
- Save actions must give clear feedback if local storage fails or is full.
- The proposal calls for 12 gear slots, while the mockup depicts 11. Keep that
  decision open until the screen and data model are reviewed together.
- The written design-system notes say dark mode, while the provided screens use
  pale surfaces with black bars. The visual mockup is the current screen-level
  reference.
- The supplied template targets web. Mobile builds may need platform folders
  regenerated if they are required for the final submission.
- Local persistence must work on the agreed target platforms without sign-in or
  a remote account service.

## Changes since the last version

- The supplied course template is now the repository structure. The static
  home screen and project documents have been adapted to it.
- The three home cards remain icon-free and now use the supplied image
  backgrounds to open their matching draft screens.
- The project direction no longer includes authentication, Firebase,
  Firestore, or cloud sync. Local persistence is the current plan for builds
  and notes, but the package choice is still open.
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
- [x] Retain the three icon-free home cards.
- [x] Remove unused feature stubs and platform scaffolds absent from the template.
- [ ] Confirm whether native mobile builds will be needed later.

### 2. Static screen draft - started

- [x] Keep a runnable app entry point and initial home screen.
- [x] Add image-led home cards with tap navigation to the three destination drafts.
- [x] Add the supplied image files to the app assets.
- [ ] Compare the screen with the 390 x 844 mockup and adjust the crop if needed.
- [ ] Refine the remaining screen layouts, colors, type, and spacing.
- [ ] Add bottom navigation and the rest of the screen transitions.

### 3. Shared bestiary - started

- [ ] Define a boss data model and local sample data.
- [x] Add a seven-row placeholder list shell.
- [ ] Replace placeholders and build the boss-detail layout shown in the mockup.
- [ ] Add loading, empty, missing-image, and long-description states where needed.

### 4. Build creator - started

- [ ] Define gear and loadout models.
- [x] Add the 11-slot visual grid shown in the mockup.
- [ ] Build interactive gear slots and the gear picker.
- [ ] Resolve the proposal's 12 slots versus the mockup's 11 visible slots.
- [ ] Add naming, create, edit, and save flows.

### 5. Milestones and notes - started

- [x] Add the note editor and saved-notes area as a screen draft.
- [ ] Decide how milestone tracking extends the mockup's simple note editor.
- [ ] Add create, edit, delete, and updated-time behavior.
- [ ] Decide whether reminders are needed and which platforms they support.

### 6. Local data and persistence - not started

- [ ] Choose a local storage approach that supports the agreed app platforms.
- [ ] Define models for saved builds and notes.
- [ ] Load and save builds and notes in the current device or browser profile.
- [ ] Show clear feedback when local reads or writes fail.
- [ ] Document that data does not sync between devices and may be removed with
      local app or browser data.

### 7. Offline behavior and save feedback - not started

- [ ] Keep the bestiary available without a network connection.
- [ ] Show success and error feedback for local saves.
- [ ] Make failed saves visible so a note or loadout is not silently lost.

### 8. Responsive behavior and accessibility - not started

- [ ] Compare each screen with the 390 x 844 mockup.
- [ ] Review narrow and wide browser sizes and text scaling.
- [ ] Check labels, keyboard focus, contrast, and tap target sizes.

### 9. Project verification - not started

- [ ] Add tests as features are implemented and verify them during development.
- [ ] Run static analysis and build for each agreed target.
- [ ] Verify builds and notes persist locally after app restarts.
- [ ] Check behavior when browser or app storage is unavailable or cleared.
- [ ] Capture current screenshots and record remaining limitations.

### 10. Final handoff - not started

- [ ] Update setup instructions after the local storage approach is selected.
- [ ] Write weekly reports during the project rather than reconstructing them later.
- [ ] Prepare a demo around the proposal's core user journey.
- [ ] Review privacy, screenshots, and security rules before submission.

Current work completes checkpoints 0 and 1 and starts checkpoints 2 through 5.
Checkpoint 6 now plans local persistence without accounts or cloud services.
The screens are drafts; their data, behavior, and remaining routes are
intentionally unfinished. Update the boxes and decisions as each stage is
completed.
