import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'AppColors.dart';
import 'Util/cart.dart';

class Shopping_cart extends StatefulWidget {
  List<CartItem> cartItems = [
    CartItem(
        name: 'Product 1',
        size: 42,
        color: '0xFF1E1E1E',
        price: 18.0,
        quantity: 1,
        image: '/page1/product1.png'),
    CartItem(
        name: 'Product 2',
        size: 38,
        color: '0xFFCE2621',
        price: 30.0,
        quantity: 1,
        image: '/page1/product1.png'),
    CartItem(
        name: 'Product 3',
        size: 39,
        color: '0xFFCE2621',
        price: 15.0,
        quantity: 1,
        image: '/page1/product1.png'),
  ];

  @override
  State<Shopping_cart> createState() => _Shopping_cartState();
}

class _Shopping_cartState extends State<Shopping_cart> {
  void _clearCart() {
    setState(() {
      widget.cartItems.clear();
    });
  }
  bool allProducts = false;
  bool product = true;
  List<bool> checkBoxValues = [false, false, false];

  @override
  Widget build(BuildContext context) {


    Widget body;
    if (widget.cartItems.isEmpty) {
      body = Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.cartItems.length} منتج ",
                style: TextStyle(fontSize: 14, color: AppColors.gray1,fontFamily: 'Avenir'),
                textDirection: TextDirection.rtl,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image: AssetImage('/page2/img.png'),
                      height: 247,
                      width: 200),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "لم تقم بأضافة اي منتج الى السلة مؤخرًا",
                    style: TextStyle(
                        fontSize: 16,fontFamily: 'Avenir',
                        color: AppColors.textColor2,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 47),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      minimumSize: Size(double.infinity, 48),
                      side: BorderSide(
                        color: Colors.brown,
                        width: 2,
                      ),
                    ),
                    child: Text('اذهب للتسوق الآن',style: TextStyle(fontFamily: 'Avenir')),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      // Show the list of items in the cart
      var cartItem;
      body = Container(
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CheckboxListTile(
              value: allProducts,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (value) {
                setState(() {
                  allProducts = value!;
                  checkBoxValues= [allProducts, allProducts, allProducts];
                });
              },
              title: Text('${widget.cartItems.length} منتجات',
                  style: TextStyle(fontSize: 14,fontFamily: 'Avenir', color: Colors.black),textDirection: TextDirection.rtl),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {final cartItem = widget.cartItems[index];
                  return Container(margin: EdgeInsets.only(bottom: 24),
                    padding:EdgeInsets.only(right: 6, left: 6, top: 12, bottom: 12),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(6),
                      border: Border.all(strokeAlign: BorderSide.strokeAlignOutside,color: AppColors.stroke,
                          width: .5,style: BorderStyle.solid),boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(.4),blurRadius: 4,offset: Offset(1, 1),),],),
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [ Text( cartItem.name, style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.textTitle,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor:
                                        Color(int.parse(cartItem.color)),
                                    radius: 6),
                                SizedBox(width: 2),
                                Text(
                                  ' اللون: ',
                                  style: TextStyle(fontFamily: 'Avenir',
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text(
                                  'المقاس: ${cartItem.size} ',
                                  style: TextStyle(fontFamily: 'Avenir',
                                    fontSize: 12,
                                    color: AppColors.text,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 70,
                                  height: 28,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/page2/remove.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${cartItem.number}',
                                          style: TextStyle(fontFamily: 'Avenir', fontSize: 16)),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      SvgPicture.asset(
                                        'assets/page2/add.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 78,
                                ),
                                Text(
                                  '\$${cartItem.price}',
                                  style: TextStyle(
                                    color: AppColors.brawn3,
                                    fontWeight: FontWeight.w400,fontFamily: 'Avenir',
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 12,right:8 ),
                          width: 112,
                          height: 80,
                          padding: EdgeInsets.all(10),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                            color: AppColors.lightBrawn2,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Image.asset(
                            cartItem.image,
                          ),
                        ),

                        // Checkbox(
                        //   checkColor: Colors.white,
                        //   activeColor: AppColors.brawn2,
                        //   value: product,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       product=value!;
                        //     });
                        //   },
                        // ),
                        Checkbox(
                          activeColor: AppColors.brawn2,
                          value: checkBoxValues[index],
                          onChanged: (value) {
                            setState(() {
                              checkBoxValues[index] = value!;
                            });
                          },

                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(thickness: .5,color: AppColors.divider, ),
            SizedBox(height: 47),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text('\$${widget.cartItems.map((item) => item.totalPrice).reduce((a, b) => a + b).toStringAsFixed(2)}'),
                  Text("التكلفة",style: TextStyle(fontFamily: 'Avenir', ),)

            ]),
            SizedBox(height: 24,),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pay');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.brown,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                minimumSize: Size(double.infinity, 48),
                side: BorderSide(
                  color: Colors.brown,
                  width: 2,
                ),
              ),
              child: Text('شراء',style: TextStyle(fontFamily: 'Avenir')),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        title: Text(
          'سلة المشتريات',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/page2/delete.svg',
            height: 20,
            width: 20,
          ),
          onPressed: _clearCart,
        ),
      ),
      body: body,
    );
  }
}
