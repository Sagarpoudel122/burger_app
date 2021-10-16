import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/widget/appbar.dart';
import 'package:burger_app/screens/product_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> categories = [
    {"name": "Burger", "image": "assets/images/burger.png"},
    {"name": "Pizza", "image": "assets/images/pizza.png"},
    {"name": "Cake", "image": "assets/images/cake.png"},
    {"name": "Burger", "image": "assets/images/burger.png"},
    {"name": "Pizza", "image": "assets/images/pizza.png"},
    {"name": "Cake", "image": "assets/images/cake.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.white,
      appBar: MyAppbar(
        title: 'Chicago IIL',
        height: 50.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 41,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ConstantColor.black.withOpacity(0.15),
                    offset: Offset(1, 1),
                    blurRadius: 10,
                    spreadRadius: 2.0,
                  ),
                ],
                border: Border.all(color: ConstantColor.transparent),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  hintText: "Search our Delicious Burger",
                  hintStyle: TextStyle(
                    color: ConstantColor.grey,
                    fontSize: 13.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: ConstantColor.transparent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 170.0,
              // padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
              color: ConstantColor.white,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int i) {
                  Map category = categories[i];
                  return Container(
                    width: 95,
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 7.0,
                    ),
                    decoration: BoxDecoration(
                      color: i == 0
                          ? ConstantColor.primaryColor
                          : ConstantColor.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ConstantColor.black.withOpacity(0.15),
                          offset: Offset(1, 1),
                          blurRadius: 10,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 65.0,
                          width: 65.0,
                          padding: EdgeInsets.all(5.0),
                          color: ConstantColor.white,
                          child: Image.asset(
                            category['image'],
                            height: 60.0,
                          ),
                        ),
                        Text(
                          category['name'],
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: i == 0
                                ? ConstantColor.white
                                : ConstantColor.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                        ),
                        Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                            color: i == 0
                                ? ConstantColor.white
                                : ConstantColor.black,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chevron_right_sharp,
                            color: i == 0
                                ? ConstantColor.primaryColor
                                : ConstantColor.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                      height: 1),
                ),
                GestureDetector(
                  child: // Figma Flutter Generator ViewallWidget - TEXT
                      Text(
                    'View all >',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ConstantColor.primaryColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: ProductProfileScreen(),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            margin: EdgeInsets.only(
                              top: 15.0,
                              left: 5.0,
                              right: 5.0,
                              bottom: 20.0,
                            ),
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: ConstantColor.black.withOpacity(0.15),
                                  offset: Offset(1, 1),
                                  blurRadius: 10,
                                  spreadRadius: 2.0,
                                ),
                              ],
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      color: ConstantColor.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chipotle Cheesy Chicken',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: ConstantColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 1),
                                    ),
                                    Text(
                                      'Rs.100',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: ConstantColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'Chicken Burger',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: ConstantColor.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/images/burger_big.png",
                              height: 130.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
