class CartItem2 {
  final String name;
  final String size;
  final String color;
  final double price;
  int number;

  CartItem2({
    required this.name,
    required this.size,
    required this.color,
    required this.price,
    this.number = 1,
  });

  double get totalPrice => price * number;
}
class CartItem {
  final String name;
  final int size;
  final String color;
  final double price;
  late final int quantity;
  final String image;
  int number;

  CartItem(
      {required this.name,
        required this.size,
        required this.color,
        required this.price,
        required this.quantity,
        required this.image,
        this.number = 1,

      });
  double get totalPrice => price * number;
}