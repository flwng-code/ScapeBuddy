# Design system

The submitted visual reference is [assets/design-system-v2.pdf](assets/design-system-v2.pdf).
This summary pairs its design tokens with the supplied mockup. The visual PDF
contains the original system; the table below records values needed while
implementing screens.

## Palette

| Token | Value | Use |
| --- | --- | --- |
| Primary | `#000000` | App bars, navigation bars, and primary actions |
| Secondary | `#717171` | Supporting controls and secondary surfaces |
| Neutral | `#F5F5F5` | Page and light card surfaces |
| Error | `#B00020` | Error feedback |
| Surface | `#FFFFFF` | Cards and input areas where contrast is needed |

The design-system example uses a light color scheme, although its prose also
mentions dark mode. The supplied screens show pale content surfaces and black
bars, so match that appearance for now.

## Type scale

| Role | Size | Weight |
| --- | ---: | --- |
| Heading | 28 sp | Bold |
| Body | 16 sp | Regular |
| Caption | 12 sp | Regular |

The PDF's sample text theme uses a 26 sp heading while its token list says 28
sp. Use 28 sp unless the student later chooses the sample value.

## Spacing

- Related controls: 8 px.
- Between sections: 16 px.
- Screen edge padding: 24 px.
- Reference viewport: 390 x 844.

## Components

Planned reusable components include:

| Component | Responsibility | Planned screens |
| --- | --- | --- |
| `AppButton` | Shared action button with optional callback | Login, Builds, Notes |
| `MonsterCard` | Compact boss summary that can open details | Bestiary |
| `MonsterInfo` | Boss facts and strategy content | Bestiary detail |
| `GearSlot` | One empty or selected equipment slot | Builds |
| `GearPicker` | Lets a player choose gear for a slot | Builds |
| `NoteField` | Note editor connected to its screen state | Milestone Notes |
| `LoadingIndicator` | Shared loading feedback | Future data screens |

These widgets are not implemented yet. The current home screen has a private
`_HomeFeatureCard` inside `lib/main.dart`; it has only a title and description
and intentionally has no leading icon.

## Changes and decisions

- The current home-card design follows the student's request to remove icons
  from Bestiary, Build Maker, and Milestone Notes.
- The proposal specifies 12 gear slots, while the mockup shows 11; do not settle
  that discrepancy until the visual and data needs are reviewed.
- The supplied mockup is the reference for visual details when written notes
  conflict.
