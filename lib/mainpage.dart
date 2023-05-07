import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homework3_store/AppColors.dart';
import 'package:homework3_store/profile_page.dart';
import 'package:homework3_store/shopcart_page.dart';

import 'favorite_page.dart';
import 'homepage.dart';
import 'myorder_page.dart';

class MyHomePage0 extends StatefulWidget {
  MyHomePage0({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage0> {
  int Index = 4;

  final List<Widget> Pages = [
    ProfilePage(),
    MyOrder(),
    Shopping_cart(),
    Favorite(),
    HomePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      Index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: AppColors.screen,
        body: Pages[Index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: Index,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.brawn2,
          items: [
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
              'assets/page1/profile.svg',
                width: 20,
                height: 20,
                color: AppColors.brawn,

        ) ,
              icon: SvgPicture.asset(
                'assets/page1/profile.svg',
                width: 20,
                height: 20,
              ),
              label: '.',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
            'assets/page1/bag.svg',
            width: 20,
            height: 20,
            color: AppColors.brawn,

              ) ,
                icon:  SvgPicture.asset(
              'assets/page1/bag.svg',
              width: 20,
              height: 20,
            ),
                label: ''
            ),
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
                'assets/page1/cart2.svg',
                width: 20,
                height: 20,
                color: AppColors.brawn,

              ) ,

              icon:SvgPicture.asset(
                'assets/page1/cart2.svg',
                width: 20,
                height: 20,

              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
                'assets/page1/favorite.svg',
                width: 20,
                height: 20,
                color: AppColors.brawn,

              ) ,

              icon:SvgPicture.asset(
                'assets/page1/favorite.svg',
                width: 20,
                height: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon:SvgPicture.asset(
                'assets/page1/home.svg',
                width: 20,
                height: 20,
                color: AppColors.brawn,

              ) ,

              icon: SvgPicture.asset(
                'assets/page1/home.svg',
                width: 20,
                height: 20,

              ),
              label: '',
            ),
          ],
        ),
      );
  }
}
