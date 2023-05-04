class Product {
  final String name;
  final String description;
  final String imagePath;
  final bool isTrending;
  final bool isNew;
  final bool isComingSoon;
  final double discount;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    this.isTrending = false,
    this.isNew = false,
    this.isComingSoon = false,
    this.discount = 0.0, required bool willBeAddedSoon,
  });

  get willBeAddedSoon => false;
}
