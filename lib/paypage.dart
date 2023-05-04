import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'AppColors.dart';
import 'Util/cart.dart';

class OrderConfirmationScreen extends StatefulWidget {
  late double tax,pay;
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


  OrderConfirmationScreen(this.tax, this.pay);

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        width: double.infinity,
        height: 234,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16,bottom: 12,right: 20),
              child: Text(
                'بيانات المستلم',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),textDirection: TextDirection.rtl,
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'احمد محمد عبد الرحمن العتيبي',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '+249755778487',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: ElevatedButton(
                onPressed: () {Navigator.pushNamed(context, '/pay');},
                style: ElevatedButton.styleFrom(
                  primary: Colors.brown,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),),
                  minimumSize: Size(double.infinity, 48),
                  side: BorderSide(
                    color: Colors.brown, width: 2,),),
                child: Text('شراء', style: TextStyle(fontFamily: 'Avenir')),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.screen,
      appBar: AppBar(
        title: Text('تأكيد الطلب',style: TextStyle(color: AppColors.brawn2)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:
      SingleChildScrollView(
        child: SizedBox(height: 880, child: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'العنوان',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.gray1,
                  fontFamily: 'Avenir',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'الخرطوم , المعمورة , شارع السجانة ',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, bottom: 8, right: 8, top: 8),
                    child: SvgPicture.asset(
                      'assets/page3/pin.svg',
                      width: 18,
                      height: 22,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(12),
                  fillColor: Colors.white,
                  // add a box shadow
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                    BorderSide(color: AppColors.searchBorder, width: .5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'طريقة الدفع',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.gray1,
                  fontFamily: 'Avenir',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintText: 'الدفع عند الاستلام ',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      'assets/page3/pay.svg',
                      width: 28,
                      height: 16,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(12),
                  fillColor: Colors.white,
                  // add a box shadow
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide:
                    BorderSide(color: AppColors.searchBorder, width: .5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 2),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'المنتجات',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.gray1,
                  fontFamily: 'Avenir',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = widget.cartItems[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 24),
                      padding:
                      EdgeInsets.only(right: 6, left: 6, top: 12, bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: AppColors.stroke,
                            width: .5,
                            style: BorderStyle.solid),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.4),
                            blurRadius: 4,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  'assets/page3/edit.svg',
                                  width: 14,
                                  height: 14,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  width: 70,
                                  height: 28,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/page2/add.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text('${cartItem.number}',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 16)),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      SvgPicture.asset(
                                        'assets/page2/remove.svg',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 78,
                                  ),
                                  Text(
                                    cartItem.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: AppColors.textTitle,
                                    ),
                                  ),
                                ],
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
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 12,
                                      color: AppColors.text,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    'المقاس: ${cartItem.size} ',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
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
                                  SizedBox(
                                    width: 78,
                                  ),
                                  Text(
                                    '\$${cartItem.price}',
                                    style: TextStyle(
                                      color: AppColors.brawn3,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Avenir',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, right: 8),
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
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    '\$${widget.cartItems.map((item) => item.totalPrice).reduce((a, b) => a + b).toStringAsFixed(2)}'),
                Text(
                  "تكلفة الشراء",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      color: AppColors.gray1
                  ),
                )
              ]),
              SizedBox(
                height: 16,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    '\$${widget.pay}'),
                Text(
                  "تكلفة الشحن",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      color: AppColors.gray1
                  ),
                )
              ]),
              SizedBox(
                height: 16,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    "\$${(widget.cartItems.map((item) => item.totalPrice).reduce((a, b) => a + b) * widget.tax).toStringAsFixed(2)}"
                ),
                Text(
                  "الضريبة",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      color: AppColors.gray1
                  ),
                )
              ]),
              SizedBox(
                height: 16,
              ),
              Divider(
                thickness: .5,
                color: AppColors.divider,
              ),
              SizedBox(
                  height: 47),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                    '\$${widget.cartItems.map((item) => item.totalPrice).reduce((a, b) => a + b).toStringAsFixed(2)}'),
                Text(
                  " التكلفة النهائية",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 16
                  ),
                )
              ]),
              SizedBox(
                height: 24,
              ),

            ],),
        ),),
      ),
    );
  }
}

