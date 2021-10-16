import 'package:burger_app/common/util/color_utils.dart';
import 'package:flutter/material.dart';

class ProfileUi extends StatefulWidget {
  const ProfileUi({Key? key}) : super(key: key);

  @override
  _ProfileUiState createState() => _ProfileUiState();
}

class _ProfileUiState extends State<ProfileUi> {
  Widget profileListAccount() {
    return Container(
      child: Row(),
    );
  }

  Widget profileListItem({
    required Widget icon,
    required String text,
    bool hideDivider = false,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: 5.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: ConstantColor.grey,
                ),
              )
            ],
          ),
          !hideDivider ? Divider() : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        // color: ConstantColor.primaryColor.withOpacity(0.3),
        width: _size.width,
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: _size.width,
              // padding: EdgeInsets.only(top: 50.0),
              color: ConstantColor.white,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    child: Icon(
                      Icons.person,
                      size: 60.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Sobhakhar Poudel",
                    style: TextStyle(
                      color: ConstantColor.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "98-xxxxxx | test@gmail.com",
                    style: TextStyle(
                      color: ConstantColor.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              // height: 230.0,
              width: _size.width,
              padding: EdgeInsets.all(10.0),
              color: ConstantColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ACCOUNT",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ConstantColor.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.person_rounded,
                      color: ConstantColor.grey,
                    ),
                    text: "Profile",
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.star,
                      color: ConstantColor.grey,
                    ),
                    text: "Saved Address",
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.notifications,
                      color: ConstantColor.grey,
                    ),
                    text: "Notification",
                    hideDivider: true,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              // height: 230.0,
              width: _size.width,
              padding: EdgeInsets.all(10.0),
              color: ConstantColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OFFERS",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ConstantColor.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.person_rounded,
                      color: ConstantColor.grey,
                    ),
                    text: "Promos",
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.star,
                      color: ConstantColor.grey,
                    ),
                    text: "Get Discounts",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              // height: 230.0,
              width: _size.width,
              padding: EdgeInsets.all(10.0),
              color: ConstantColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SETTINGS",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: ConstantColor.grey,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.person_rounded,
                      color: ConstantColor.grey,
                    ),
                    text: "Themes",
                  ),
                  profileListItem(
                    icon: Icon(
                      Icons.star,
                      color: ConstantColor.grey,
                    ),
                    text: "Languages",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
