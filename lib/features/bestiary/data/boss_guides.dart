import '../models/boss_guide.dart';

/// Boss names and guide notes transcribed from the project boss document.
const bossGuides = <BossGuide>[
  BossGuide(
    name: 'Vorkath',
    description:
        'Vorkath is a powerful blue dragon boss found on the island of Ungael. '
        'After completing Dragon Slayer II, players can fight Vorkath repeatedly. '
        'He uses melee, Magic, ranged, and powerful dragonfire attacks.',
    iconAsset: 'assets/images/bestiary/icons/vorkath.png',
    heroImageAsset: 'assets/images/bestiary/heroes/vorkath_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Melee attack: Uses his claws or wings when the player is nearby.',
        'Magic attack: Fires a blue projectile at the player.',
        'Ranged attack: Fires a projectile made from bones and flesh.',
        'Acid phase: Covers the arena with acid pools and repeatedly fires dragonfire at the player’s position.',
        'Prayer-disabling dragonfire: Can turn off the player’s active prayers.',
        'Venomous dragonfire: Can inflict venom.',
        'Zombified spawn: Summons a creature that must be killed with Crumble Undead.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'The fight follows a pattern of six standard attacks followed by a special attack. The most dangerous mechanics are the acid pools, rapid-fire attack, and zombified spawn.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Maintain dragonfire protection throughout the fight. Keep moving during the acid phase and avoid standing on acid pools. Kill the zombified spawn quickly before returning your attention to Vorkath.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Enter Vorkath’s arena.',
        'Use quick prayers for Protect from Magic and Piety, or Rigour when using ranged.',
        'Attack Vorkath while watching his attack cycle.',
        'Move continuously during the acid special attack.',
        'Kill the zombified spawn when it appears.',
        'Watch for the prayer-disabling dragonfire.',
        'Continue attacking until Vorkath is defeated.',
      ]),
    ],
  ),
  BossGuide(
    name: 'Zulrah',
    description:
        'Zulrah is a large serpent boss that changes between forms during the fight. '
        'Each form has different attacks and weaknesses, so players need to change '
        'combat styles and protection prayers.',
    iconAsset: 'assets/images/bestiary/icons/zulrah.png',
    heroImageAsset: 'assets/images/bestiary/heroes/zulrah_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Ranged attack.',
        'Magic attack.',
        'Melee tail attack.',
        'Venom.',
        'Snakelings.',
        'Venom clouds.',
      ]),
      BossGuideSection.bullets('Forms', [
        'Green form: Primarily uses Ranged and is weak to Magic.',
        'Blue form: Uses Magic and Ranged. Magic attacks are common, so Protect from Magic is useful.',
        'Red form: Uses a powerful melee-style tail attack that can be avoided by moving away.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'Zulrah follows one of several set rotations. It dives into the swamp and reappears in another position and form. It can also summon snakelings and create venom clouds.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Learn Zulrah’s rotations and recognize each form by its color. Switch between Magic and Ranged equipment depending on the form. Avoid venom clouds and keep track of protection prayers.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Enter Zulrah’s shrine.',
        'Identify Zulrah’s current form.',
        'Use the appropriate combat style.',
        'Switch protection prayers according to its attacks.',
        'Move around the island as Zulrah changes positions.',
        'Avoid venom clouds.',
        'Deal with snakelings when necessary.',
        'Follow the rotation until Zulrah is defeated.',
      ]),
    ],
  ),
  BossGuide(
    name: 'Giant Mole',
    description:
        'The Giant Mole is a large mole boss beneath Falador. Its main mechanic is '
        'burrowing to another place in the cave when its health becomes low.',
    iconAsset: 'assets/images/bestiary/icons/giant_mole.png',
    heroImageAsset: 'assets/images/bestiary/heroes/giant_mole_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Melee attack: Swipes the player with its claws.',
        'Burrow: Moves underground and reappears somewhere else in the lair.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'When the Giant Mole reaches between 5 and 50 health, player attacks have a chance to make it burrow to another location. It can also extinguish certain open light sources when it burrows.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Ranged attacks are useful because the Giant Mole has relatively low Ranged defence and cannot path around obstacles. Players using melee can use Protect from Melee.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Enter the Mole Lair.',
        'Locate the Giant Mole.',
        'Attack it using your preferred combat style.',
        'Use Protect from Melee if fighting at close range.',
        'When it burrows, locate it again.',
        'Continue attacking until it is defeated.',
      ]),
    ],
  ),
  BossGuide(
    name: 'Kraken',
    description:
        'Kraken is a Slayer boss inside Kraken Cove. The fight is fairly '
        'straightforward and is normally fought using Magic.',
    iconAsset: 'assets/images/bestiary/icons/kraken.png',
    heroImageAsset: 'assets/images/bestiary/heroes/kraken_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Kraken attack: A typeless magical ranged attack.',
        'Enormous tentacles: Four tentacles around the boss also attack the player.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'Kraken cannot be reached by normal melee weapons. Its attacks are typeless, so normal protection prayers do not block their damage.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Use Magic as the main combat style. A fishing explosive can start the encounter when used on the large whirlpool. Focus damage on Kraken instead of spending time killing every tentacle.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Enter Kraken Cove while on a Kraken Slayer task.',
        'Use a fishing explosive on the large whirlpool.',
        'Attack Kraken using Magic.',
        'Continue attacking the main boss.',
        'Tank the relatively low-damage tentacle attacks.',
        'Keep your health above a safe level.',
        'Defeat Kraken and collect the drops.',
      ]),
    ],
  ),
  BossGuide(
    name: 'King Black Dragon',
    description:
        'The King Black Dragon, commonly called KBD, is a powerful three-headed '
        'black dragon. Its lair is reached through the Wilderness.',
    iconAsset: 'assets/images/bestiary/icons/king_black_dragon.png',
    heroImageAsset: 'assets/images/bestiary/heroes/king_black_dragon_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Melee attack.',
        'Normal dragonfire.',
        'Shock dragonfire.',
        'Ice dragonfire.',
        'Poison dragonfire.',
      ]),
      BossGuideSection.bullets('Special Dragonfire Effects', [
        'Shock dragonfire can reduce the player’s stats.',
        'Ice dragonfire can freeze the player.',
        'Poison dragonfire can inflict poison.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'KBD’s dragonfire is stronger than that of normal adult dragons. Its special dragonfire attacks can add effects even when protection is being used.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Use strong dragonfire protection and appropriate antifire equipment. Watch for the special dragonfire effects, especially freezing and poison. Take care while travelling through the Wilderness to reach the lair.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Prepare dragonfire protection.',
        'Travel through the Wilderness to the KBD entrance.',
        'Enter the boss lair.',
        'Maintain dragonfire protection.',
        'Attack KBD while watching for its special dragonfire.',
        'Deal with poison or freezing effects when needed.',
        'Continue attacking until KBD is defeated.',
      ]),
    ],
  ),
  BossGuide(
    name: 'Sarachnis',
    description:
        'Sarachnis is a giant spider boss in Forthos Dungeon. She uses melee and '
        'Ranged attacks and can summon smaller creatures during the fight.',
    iconAsset: 'assets/images/bestiary/icons/sarachnis.png',
    heroImageAsset: 'assets/images/bestiary/heroes/sarachnis_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Melee attack.',
        'Ranged attack.',
        'Web attack.',
        'Healing attack.',
        'Spawn summons.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'Sarachnis can heal herself when her attacks damage the player. She can fire a sticky web that binds the player, and she summons smaller creatures at certain health percentages.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Sarachnis is weak to Crush attacks and has relatively high Magic and Ranged defence, so a fast Crush weapon is useful. Switch protection prayers based on whether she is attacking with melee or Ranged.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Enter Sarachnis’s arena.',
        'Equip a Crush-focused melee weapon.',
        'Attack Sarachnis.',
        'Use Protect from Melee when she attacks from close range.',
        'Use Protect from Missiles when she attacks from a distance.',
        'Watch for the web attack.',
        'Deal with summoned creatures when needed.',
        'Continue attacking until Sarachnis is defeated.',
      ]),
    ],
  ),
  BossGuide(
    name: 'Skotizo',
    description:
        'Skotizo is a powerful demon beneath the Catacombs of Kourend. Players '
        'need a Dark Totem to enter his lair, where Awakened Altars affect the fight.',
    iconAsset: 'assets/images/bestiary/icons/skotizo.png',
    heroImageAsset: 'assets/images/bestiary/heroes/skotizo_hero.png',
    sections: [
      BossGuideSection.bullets('Main Attacks', [
        'Melee attack.',
        'Magic attack.',
        'Awakened Altars.',
        'Summoned creatures.',
      ]),
      BossGuideSection.paragraphs('Important Mechanics', [
        'Skotizo can activate Awakened Altars around the room. Active altars increase his defence, so deactivate them during the fight.',
      ]),
      BossGuideSection.paragraphs('Strategy', [
        'Demonbane weapons are particularly useful against Skotizo. Watch the Awakened Altars and deactivate them when they become active. Use the appropriate protection prayer and keep moving when needed.',
      ]),
      BossGuideSection.steps('Kill Guide', [
        'Obtain a Dark Totem.',
        'Enter the Catacombs of Kourend.',
        'Use the Dark Totem on the central altar.',
        'Enter Skotizo’s lair.',
        'Attack Skotizo.',
        'Deactivate Awakened Altars when they become active.',
        'Deal with summoned creatures when needed.',
        'Continue attacking until Skotizo is defeated.',
      ]),
    ],
  ),
];
