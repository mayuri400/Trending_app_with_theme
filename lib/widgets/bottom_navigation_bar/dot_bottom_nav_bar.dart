library dot_bottom_nav_bar;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_app/widgets/bottom_navigation_bar/bottom_nav_item.dart';


class DotBottomNavBar extends StatelessWidget {
  const DotBottomNavBar(
      {required this.items,
      required this.currentIndex,
      required this.onTap,
      this.backgroundColor,
      this.boxShadow,
      this.height,
      this.borderRadius,
      this.selectedColor,
      this.unselectedColor,
      this.iconSize,
      this.dotColor,
      Key? key})
      : super(key: key);

  /// Variables ///

  /// Specifies the bottom navigation items of the bar and must be of type [_DotBottomNavItem].
  final List<BottomNavItem> items;

  /// Returns the current index of each item.
  final int currentIndex;

  /// Click on any item to move the desired index.
  final Function(int) onTap;

  /// Background defines the bottom navigation bar and is [Colors.white] by default.
  final Color? backgroundColor;

  /// The bottom shadow defines the navigation bar.
  final BoxShadow? boxShadow;

  /// Specifies the height of the navigation bar bottom and is [kBottomNavigationBarHeight / 0.8] by default.
  final double? height;

  /// The radius defines the space of the bottom navigation bar and is null by default.
  final BorderRadiusGeometry? borderRadius;

  /// The selected color is the icon, and if it is null, it uses [Theme.of(context).primaryColor].
  final Color? selectedColor;

  /// The unselected color is the icon, and if it is null, it uses [Colors.grey].
  final Color? unselectedColor;

  /// Is the size of the icon, and if it is null, its default size is [24].
  final double? iconSize;

  /// The color of the circle is for each item, and if it is null, it uses [Theme.of(context).primaryColor].
  final Color? dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          boxShadow ??
              BoxShadow(
                  color: Colors.black12.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  spreadRadius: 0.1,
                  blurRadius: 20)
        ],
      ),
      alignment: Alignment.center,
      height: height ?? kBottomNavigationBarHeight / 0.8,
      child: Row(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            DotBottomNavItem(
              emptySvg: items[i].emptySvg,
              fillSvg: items[i].fillSvg,
              label: items[i].label,
              index: i,
              onTap: onTap,
              currentIndex: currentIndex,
              selectedColor: selectedColor,
              unselectedColor: unselectedColor,
              iconSize: iconSize,
              dotColor: dotColor,
            )
          ]
        ],
      ),
    );
  }
}

class BottomNavItem {
  final String emptySvg;
  final String fillSvg;
  final String label;

  BottomNavItem({
    required this.emptySvg,
    required this.fillSvg,
    required this.label,
  });
}
