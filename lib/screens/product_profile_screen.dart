import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

class ProductProfileScreen extends StatefulWidget {
  const ProductProfileScreen({Key? key}) : super(key: key);

  @override
  _ProductProfileScreenState createState() => _ProductProfileScreenState();
}

class _ProductProfileScreenState extends State<ProductProfileScreen> {
  Widget _container(Widget child) {
    return Container(
      height: 45.0,
      width: 45.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ConstantColor.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: ConstantColor.black.withOpacity(0.15),
            offset: Offset(1, 1),
            blurRadius: 10,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: _size.height * 0.67,
                  margin: EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(500.0),
                      bottomLeft: Radius.circular(500.0),
                    ),
                    color: ConstantColor.white,
                    boxShadow: [
                      BoxShadow(
                        color: ConstantColor.black.withOpacity(0.15),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 35.0,
                  left: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: _container(
                          Icon(
                            Icons.chevron_left,
                            size: 35.0,
                          ),
                        ),
                      ),
                      _container(
                        Icon(
                          Icons.favorite_border,
                          color: ConstantColor.primaryColor,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: _size.height * 0.15,
                  left: 10.0,
                  right: 10.0,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chipotle Cheesy Chicken',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: ConstantColor.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900,
                          height: 1,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'A signature flame-grilled chicken patty topped with smoked beef',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ConstantColor.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/burger_detail.png",
                          // color: ConstantColor.primaryColor,
                          height: 290.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40.0,
                  left: _size.width * 0.12,
                  child: _container(
                    Text(
                      "S",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  // bottom: -3.0,
                  left: _size.width * 0.45,
                  child: _container(
                    Text(
                      "M",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 35,
                  right: _size.width * 0.10,
                  child: _container(
                    Text(
                      "L",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: BoxDecoration(
                      color: ConstantColor.primaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.only(right: 15.0),
                    child: Icon(Icons.add),
                  ),
                  Container(
                    height: 30.0,
                    width: 30.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ConstantColor.transparent,
                    ),
                    child: Text(
                      "4",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Container(
                    height: 35.0,
                    width: 35.0,
                    margin: EdgeInsets.only(left: 15.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ConstantColor.primaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.0,
                          color: ConstantColor.grey,
                        ),
                      ),
                      Text(
                        "Rs. 140",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      print("object");
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: CartScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 60.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        color: ConstantColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 25.0,
                            color: ConstantColor.white,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Go to Cart",
                            style: TextStyle(
                              color: ConstantColor.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
