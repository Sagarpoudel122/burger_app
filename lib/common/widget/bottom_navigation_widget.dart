import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FABBottomAppBarItem {
  dynamic svgImageSelected;
  dynamic svgImageUnselected;
  String text;
  FABBottomAppBarItem({
    required this.text,
    required this.svgImageSelected,
    required this.svgImageUnselected,
  });
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    required this.items,
    required this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    required this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex,
    required this.selectedTextStyle,
    required this.unselectedTextStyle,
  }) {
    assert(this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  //
  final TextStyle selectedTextStyle;
  final TextStyle unselectedTextStyle;

  final int currentIndex;
  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  _updateIndex(int index) {
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(
      widget.items.length,
      (int index) {
        return _buildTabItem(
          item: widget.items[index],
          index: index,
          onPressed: _updateIndex,
        );
      },
    );

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    bool isSelected = widget.currentIndex == index;

    Color color = isSelected ? widget.selectedColor : widget.color;
    TextStyle textStyle =
        isSelected ? widget.selectedTextStyle : widget.unselectedTextStyle;
    Widget svgImage =
        isSelected ? item.svgImageSelected : item.svgImageUnselected;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.canvas,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                svgImage,
                SizedBox(
                  width: 3.0,
                ),
                Text(
                  item.text,
                  style: textStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
