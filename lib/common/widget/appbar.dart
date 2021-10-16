import 'package:burger_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../util/color_utils.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  const MyAppbar({Key? key, required this.title, this.height: 60.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        brightness: Brightness.light,
        backgroundColor: ConstantColor.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: ConstantColor.black,
        ),
        centerTitle: true,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: ConstantColor.primaryColor,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0,
                  color: ConstantColor.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: CartScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 5.0),
              child: Stack(
                children: [
                  CircleAvatar(
                    child: Icon(Icons.shopping_bag_outlined),
                  ),
                  Positioned(
                    top: -2,
                    right: -3,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ConstantColor.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 17.0,
                      width: 17.0,
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: ConstantColor.primaryColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class MyStackAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  const MyStackAppbar({Key? key, required this.title, this.height: 60.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: ConstantColor.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 40.0,
          icon: Icon(
            Icons.chevron_left_outlined,
            color: ConstantColor.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ConstantColor.black,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
