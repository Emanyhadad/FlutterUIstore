import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homework3_store/AppColors.dart';

import 'Util/product.dart';
import 'itemproduct.dart';

class HomePage extends StatefulWidget {@override State<HomePage> createState() => _HomePageState();}


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  PageController controller = PageController(initialPage: 0);late TabController controllerTab;
  final List<Product> products = [
    Product(
      name: 'حذاء رياضي',
      description: 'نايكي',
      imagePath: 'assets/page1/product1.png',
      isNew: true,
      isTrending: true,
      willBeAddedSoon: false,
      discount: 20,
    ),
    Product(
      name: 'كاب رياضي',
      description: 'نايكي',
      imagePath: 'assets/page1/product2.png',
      isNew: false,
      isTrending: true,
      willBeAddedSoon: false,
      discount: 0,
    ),
    Product(
      name: 'بلوزة موضة',
      description: 'اورجينال',
      imagePath: 'assets/page1/product3.png',
      isNew: false,
      isTrending: false,
      willBeAddedSoon: false,
      discount: 20,
    ),
    Product(
      name: 'شرط قطن',
      description: 'قوتونيل',
      imagePath: 'assets/page1/product4.png',
      isNew: true,
      isTrending: false,
      willBeAddedSoon: false,
      discount: 0,
    ),
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    controllerTab =new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: AppColors.screen,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(56),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                // Add horizontal padding of 16
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Text("اهلاً وسهلاً",
                      style: TextStyle(fontFamily: 'Avenir',color: Colors.black, fontSize: 16)),
                  centerTitle: true,
                  leadingWidth: 20,
                  actions: [
                    SvgPicture.asset(
                      'assets/page1/notifications.svg',
                      width: 15.5,
                      height: 20,
                    ),
                  ],
                  foregroundColor: AppColors.iconAppBar,
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text("Eman Hadad",style: TextStyle(fontFamily: 'Avenir',)),
                    accountEmail: Text("Emanhadad17@gmail.com",style: TextStyle(fontFamily: 'Avenir',)),
                    currentAccountPicture: CircleAvatar(
                        radius: 10,
                        child: Image(
                          image: AssetImage('/page1/girl.png'),
                        )),
                    currentAccountPictureSize: Size(80, 80),
                    otherAccountsPictures: [
                      CircleAvatar(
                          radius: 10,
                          child: Image(
                            image: AssetImage('/page1/girl.png'),
                          )),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      "My Profile",style: TextStyle(fontFamily: 'Avenir',)
                    ),
                    leading: SvgPicture.asset(
                      'assets/page1/profile.svg',
                      width: 20,
                      height: 20,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.pushNamed(context, "/profile_page");
                    },
                  ),
                  Divider(
                    thickness: .5,
                  ),
                  ListTile(
                    title: Text('Setting',style: TextStyle(fontFamily: 'Avenir',)),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(
                    thickness: .5,
                  ),
                ],
              ),
            ),
            body: Container(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 4,
                          spreadRadius: 0,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.searchBorder,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(35),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 9,
                                right: 8,
                                left: 8,
                                bottom: 9,
                              ),
                              hintText: 'ابحث عن تيشرتات ،قمصان..',
                              border: InputBorder.none, // hide the bottom line
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: SizedBox(
                            width: .5,
                            height: 40,
                            child: Container(
                              color: AppColors.search,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/page1/search.svg',
                            width: 21,
                            height: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
              SizedBox(
                height: 198,
                child: Stack(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        children: [
                          _buildContainer(AppColors.brawn2),
                          _buildContainer(AppColors.lightBrawn2),
                          _buildContainer(AppColors.brawn),
                          _buildContainer(AppColors.lightBrawn),
                        ],
                      ),
                    ),
                    Positioned(
                      height: 30,
                      width: 30,
                      bottom: 32,
                      right: 21,
                      child: Stack(
                        children: [
                          for (int i = 0; i < 4; i++)
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(left: i * 8.0),
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPage == i
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.4),
                      blurRadius: 4,
                      offset: Offset(1, 1),
                    )
                  ],
                  border: Border.all(
                    width: .5,
                    color: AppColors.tabBorder,
                    style: BorderStyle.solid,
                  ),
                ),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    indicatorColor: AppColors.secondaryColor,
                    labelColor: Colors.white,
                    controller: controllerTab,
                    unselectedLabelColor: Colors.brown,
                    tabs: [
                      Tab(text: 'وصل حديثًا', height: 48),
                      Tab(text: 'الأكثر مبيعًا', height: 48),
                      Tab(text: 'العروض', height: 48),
                    ],
                  ),
                ),
              ),

              SingleChildScrollView(
                    child: Container(
                      height:530,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 18),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 10),
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Expanded(
                                child: ItemProduct(product: products[index]),),],);},),
                    ),
                  ),

                ])));

  }
  Widget _buildContainer(Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 24, top: 24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 198,
      padding: EdgeInsets.only(right: 12, left: 12, top: 14),
      child: Stack(
        children: [
          Positioned(
            top: 21,
            child: Image(
              image: AssetImage('/page1/girl.png'),
              width: 193,
              height: 115,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            bottom: 72,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "عروض دمار لأرخص الأسعار",
                  style: TextStyle(fontFamily: 'Avenir',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  " حملة تخفيضات الصيف",
                  style: TextStyle(fontFamily: 'Avenir',
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
