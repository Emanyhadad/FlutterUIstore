import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework3_store/paypage.dart';
import 'package:homework3_store/profile_page.dart';
import 'package:homework3_store/mainpage.dart';
import 'package:homework3_store/shopcart_page.dart';
import 'package:homework3_store/try.dart';
import 'package:homework3_store/try2.dart';

import 'AppColors.dart';
import 'homepage.dart';



void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale('ar'),
      color: AppColors.screen,
        initialRoute:  "/myHome",
        routes: {
          "/myHome": (context)=>MyHomePage0(),

          "/myOrder": (context)=>Shopping_cart(),
          "/profile_page": (context)=>ProfilePage(),
          "/home": (context)=>HomePage(),
          "/pay": (context)=>OrderConfirmationScreen(.5,5.5),
          "/try": (context)=>tryy(.05,5.5),
        },

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text(widget.title),
//           ),
//           body:  SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SvgPicture.asset(
//                     'assets/page1/bag.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/cart.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/cart2.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/drawer.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/favorite.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/fire.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/home.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/like.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/notifications.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/profile.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/search.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page1/star.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   const Image(image: AssetImage('/page1/girl.png')),
//                   const Image(image: AssetImage('/page1/product1.png')),
//                   const Image(image: AssetImage('/page1/product2.png')),
//                   const Image(image: AssetImage('/page1/product3.png')),
//                   const Image(image: AssetImage('/page1/product4.png')),
//
//                   SvgPicture.asset(
//                     'assets/page2/delete.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page2/add.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page2/remove.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//
//                   const Image(image: AssetImage('/page2/img.png')),
//
//                   SvgPicture.asset(
//                     'assets/page3/pin.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page3/pay.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//                   SvgPicture.asset(
//                     'assets/page3/edit.svg',
//                     width: 20,
//                     height: 20,
//                   ),
//
//                 ],
//               ),
//
//           ),
//         ),
//       ),
//     );
//   }
// }
