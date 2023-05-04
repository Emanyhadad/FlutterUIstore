import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework3_store/AppColors.dart';

import 'Util/product.dart';

class ItemProduct extends StatefulWidget {
  final Product product;

  const ItemProduct({required this.product});

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    bool Favorite = false;
    return Container(
      height: 225,
      width: 159,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(-2, 2),)
          ]),
      child: Column(
        children: [
          Container(
            height: 126,
            child: Stack(
              children: [
                Expanded(
                  child: Container(
                      color: AppColors.lightBrawn2,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Image.asset(widget.product.imagePath)),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child:
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 14,
                    child: Checkbox(
                      value: Favorite, onChanged: (value) {
                      setState(() {
                        Favorite = value!;
                      });
                    },),
                  ),
                ),
                if (widget.product.isNew) ...[
                  Positioned(
                    left: 8,
                    bottom: 10,
                    child: Container(
                      width: 51,
                      height: 21,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 5,right: 4.5),
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            'assets/page1/star.svg',
                            width: 12,
                            height:12,
                          ),
                          Text(
                            'جديد',
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),],
                if (widget.product.isTrending) ...[
                  Positioned(
                    right:8 ,
                    bottom: 10,
                    child: Container(
                      height: 21,
                      width: 46,
                      padding: EdgeInsets.only(right: 4.5,left: 6),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            'assets/page1/fire.svg',
                            width: 9,
                            height:12,
                          ),
                          Text(
                            'ترند',
                            style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),
                          ),

                        ],
                      ),
                    ),
                  ),],
                if (widget.product.willBeAddedSoon) ...[
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.brawn,
                    ),
                    child: Text(
                      'قريبًا',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                if(widget.product.discount !=0)...[
                  Positioned(
                    left:8 ,
                    bottom: 45,
                    child: Container(
                      height:20,
                      width: 36,
                      padding: EdgeInsets.only(left: 4),
                      decoration: BoxDecoration(
                        color: AppColors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:
                          Text(
                            '${widget.product.discount}% ',
                            style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),
                          ),

                    ),
                  ),],
              ],
            ),
          ),
          Container(
            height: 99,
            child: Stack(
              children:[
                Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: AppColors.textColor),
                      maxLines: 1,

                    ),
                    Text(
                      widget.product.description,
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: AppColors.textColor),
                      maxLines: 1,

                    ),
                    if (widget.product.discount > 0)
                      Text(
                        '${widget.product.discount}% off',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],),
              )),
                 Positioned(
                   bottom: 0,
                   left: 0,
                   child: Container(
                     height: 36,
                     width: 36,
                     padding: EdgeInsets.all(8),
                     decoration: BoxDecoration(
                     color: AppColors.brawn3,
                       borderRadius: BorderRadius.only(topRight: Radius.circular(14))),
                   child: SvgPicture.asset(
                     'assets/page1/cart.svg',
                     width: 19,
                     height: 18,
                   ),
                   ),
                 )
              ]
            ),
          )


        ],
      ),
    );
  }
}
