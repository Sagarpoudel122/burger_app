import 'package:flutter/material.dart';

class NavigationUtils {
  static naviagteToFirstPage({
    required BuildContext buildContext,
  }) {
    Navigator.of(buildContext).popUntil((route) => route.isFirst);
  }
}
