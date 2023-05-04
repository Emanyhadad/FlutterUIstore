import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String size;
  final String color;
  final double price;
  late final int quantity;
  final String image;

  CartItem(
      {required this.name,
      required this.size,
      required this.color,
      required this.price,
      required this.quantity,
      required this.image});
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<CartItem> _cartItems = [
    CartItem(
        name: 'Product 1',
        size: 'M',
        color: 'Red',
        price: 10.0,
        quantity: 1,
        image: 'https://picsum.photos/200'),
    CartItem(
        name: 'Product 2',
        size: 'L',
        color: 'Blue',
        price: 20.0,
        quantity: 1,
        image: 'https://picsum.photos/200'),
    CartItem(
        name: 'Product 3',
        size: 'S',
        color: 'Green',
        price: 15.0,
        quantity: 1,
        image: 'https://picsum.photos/200'),
  ];

  void _incrementQuantity(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (_cartItems[index].quantity > 1) {
        _cartItems[index].quantity--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _cartItems.clear();
              });
            },
          ),
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount:_cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = _cartItems[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:   Image.network(
                      cartItem.image,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.name,
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'الحجم: ${cartItem.size} | اللون: ${cartItem.color}',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${cartItem.price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14.0),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      cartItem.quantity++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Icon(Icons.add, size: 16.0),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(cartItem.quantity.toString()),
                                SizedBox(width: 8.0),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (cartItem.quantity > 1) {
                                        cartItem.quantity--;
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Icon(Icons.remove, size: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),


    );
  }
}
