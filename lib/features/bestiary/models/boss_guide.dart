/// Data used by both a boss row and its full bestiary page.
class BossGuide {
  const BossGuide({
    required this.name,
    required this.description,
    required this.iconAsset,
    required this.heroImageAsset,
    required this.sections,
  });

  final String name;
  final String description;
  final String iconAsset;
  final String heroImageAsset;
  final List<BossGuideSection> sections;
}

/// A titled group of paragraphs or a short list on a boss detail page.
class BossGuideSection {
  const BossGuideSection.paragraphs(this.title, this.items)
      : listStyle = BossGuideListStyle.none;

  const BossGuideSection.bullets(this.title, this.items)
      : listStyle = BossGuideListStyle.bullets;

  const BossGuideSection.steps(this.title, this.items)
      : listStyle = BossGuideListStyle.numbered;

  final String title;
  final List<String> items;
  final BossGuideListStyle listStyle;
}

enum BossGuideListStyle { none, bullets, numbered }
