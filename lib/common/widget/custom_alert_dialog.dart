import 'dart:async';

import '../util/color_utils.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog {
  static _defaultFunction() {}
  static alert({
    required BuildContext context,
    required String type,
    required String title,
    required String message,
    String btn1Text = "Dismiss",
    required VoidCallback btn1Action,
    required int buttonCount,
    String btn2Text = "Dismiss",
    VoidCallback bnt2Action = _defaultFunction,
    bool autoClose = false,
  }) {
    Widget header = Container();
    if (type == "warning") {
      header = Image(
        image: AssetImage("assets/images/warning.png"),
        height: 80.0,
      );
    } else if (type == 'success') {
      header = Icon(
        Icons.check,
        color: ConstantColor.primaryColor,
        size: 80.0,
      );
    } else if (type == "question") {
      header = Icon(
        Icons.warning,
        color: ConstantColor.primaryColor,
        size: 80.0,
      );
    } else if (type == "error") {
      header = Image(
        image: AssetImage("assets/images/warning.png"),
        height: 80.0,
      );
    }
    Timer _timer = Timer(Duration(seconds: 1), () {});
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext buildcontext) {
        _timer = Timer(Duration(seconds: 5), () {
          if (autoClose) {
            Navigator.of(buildcontext).pop();
          }
        });

        return AlertDialog(
          contentPadding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(204, 204, 204, 1.0),
              width: 0,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: header,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.5,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border(
                            //   top: BorderSide(color: grey),
                            //   right: BorderSide(color: grey),
                            // ),
                            ),
                        height: 35.0,
                        child: FlatButton(
                          onPressed: btn1Action,
                          child: Text(
                            btn1Text,
                            style: TextStyle(
                              color: ConstantColor.primaryColor,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    buttonCount == 2
                        ? Expanded(
                            child: Container(
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     top: BorderSide(color: Colors.grey),
                              //   ),
                              // ),
                              height: 35.0,
                              child: FlatButton(
                                  onPressed: bnt2Action,
                                  child: Text(
                                    btn2Text,
                                    style: TextStyle(
                                      color: ConstantColor.primaryColor,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  textColor: Colors.white),
                            ),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          ),
        );
      },
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }

  static imageDialog({
    required BuildContext context,
    required String image,
    required bool autoClose,
  }) {
    Widget header;

    Timer _timer = Timer(Duration(seconds: 1), () {});
    return showModalBottomSheet<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext buildcontext) {
        _timer = Timer(Duration(seconds: 5), () {
          if (autoClose) {
            Navigator.of(buildcontext).pop();
          }
        });
        return SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Image(
                image: NetworkImage(image),
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Divider(),
            ],
          ),
        );
      },
    ).then((value) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }
}
