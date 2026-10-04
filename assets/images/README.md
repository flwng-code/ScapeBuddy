# Home card images

These image files are used by the three home cards:

- `bestiary.jpg`
- `build_maker.jpg`
- `milestone_notes.jpg`

Replace a file here to change that card's artwork. JPG and PNG files are
supported; if you use PNG, update the matching path in
`lib/features/home/presentation/home_screen.dart`.

## Bestiary images

The list uses 32 x 32 PNG icons from `bestiary/icons/`. The current icons are
simple placeholders made for the first version of the screen. Replace them
with final boss icons using the same filenames:

- `vorkath.png`
- `zulrah.png`
- `giant_mole.png`
- `kraken.png`
- `king_black_dragon.png`
- `sarachnis.png`
- `skotizo.png`

The boss detail pages have a large image area below each boss name. Add a PNG
for a boss in `bestiary/heroes/` using the same filename, such as
`bestiary/heroes/vorkath.png`. The app shows an image placeholder until a boss
image is added.
