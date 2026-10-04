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
| `AppButton` | Shared action button with optional callback | Builds, Notes |
| `BossGuideTile` | 32 x 32 icon, boss name, and short description; opens the guide | Bestiary, implemented |
| `BossDetailScreen` | Boss image area, description, attacks, mechanics, and kill steps | Bestiary, implemented |
| `GearSlot` | One empty or selected equipment slot | Builds |
| `GearPicker` | Lets a player choose gear for a slot | Builds |
| `NoteField` | Note editor connected to its screen state | Milestone Notes |
| `LoadingIndicator` | Shared loading feedback | Future data screens |

The home screen in `lib/features/home/presentation/home_screen.dart` has large
image-led cards with a title and description. The full card is tappable and has
no leading icon.

The Bestiary reads its boss guide content from
[`docs/assets/boss-document-and-information.pdf`](assets/boss-document-and-information.pdf).
List icon placeholders are 32 x 32 PNGs in
`assets/images/bestiary/icons/`. Each detail page has a large image area below
the boss name; add boss artwork to `assets/images/bestiary/heroes/` to fill it.

## Changes and decisions

- The current home-card design follows the student's request to remove icons
  from Bestiary, Build Maker, and Milestone Notes while using image backgrounds.
- The proposal specifies 12 gear slots, while the mockup shows 11; do not settle
  that discrepancy until the visual and data needs are reviewed.
- The supplied mockup is the reference for visual details when written notes
  conflict.
