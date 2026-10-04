# Mockup and screen flow

The submitted mockup PDF is [assets/mockup.pdf](assets/mockup.pdf). Its stated
design size is 390 x 844. No standalone Figma URL was included in the supplied
files, so this PDF is the available visual reference.

## Mockup

The PDF contains the screen flow and captures for the planned app. The first
implementation should compare against those screen images directly. The home
screen now uses large image-led cards that open their matching destination
screens. The supplied images are stored in `assets/images/` as `bestiary.jpg`,
`build_maker.jpg`, and `milestone_notes.jpg`.

## Wireframes and flow

The submitted mockup shows sign-in before Home, then routes to the Bestiary, a
boss detail page, Builds, or Milestone Notes. The current project decision
removes sign-in, so the app opens directly on Home. Bottom navigation appears
on the main feature screens in the reference and remains a later layout task.

## Screens

### Login (removed from current scope)

Email and password fields, a forgot-password action, and a prominent sign-in
button are shown in the submitted PDF. This screen is kept as a historical
reference but will not be built for the current app.

### Home

A black title bar and large image-led destinations for Bestiary, Build Maker,
and Milestone Notes. Each full card is tappable and opens its matching screen.
The cards have no leading icons. The destination screens are still drafts.

### Bestiary

A title and monster count followed by the seven compact boss cards shown in the
mockup. Each card is expected to open its detail screen.

### Bestiary detail

A boss name and level, battle image, weakness and combat facts, moveset, and
numbered strategy tips.

### Builds

A build name, equipped-slot count, and a gear-slot grid. The mockup depicts 11
empty slots, while the proposal calls for 12; the final count is undecided.

### Milestone Notes

A note editor with Save and Cancel actions and an example saved entry. The
proposal also mentions milestones and reminders, which need a later flow
decision.

## Visual implementation note

The design-system prose mentions dark mode, but its example scheme is light and
the mockup itself uses light page surfaces with black bars. The screens in the
mockup take priority for visual matching until the student decides otherwise.
