
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DotBottomNavItem extends StatelessWidget {

  const DotBottomNavItem(
      {required this.emptySvg,
      required this.fillSvg,
      required this.label,
      required this.index,
      required this.currentIndex,
      required this.onTap,
      this.selectedColor,
      this.unselectedColor,
      this.iconSize,
      this.dotColor,
      Key? key})
      : super(key: key);

  /// Variables ///

  /// The empty state shows the svg of each item.
  final String emptySvg;

  /// The filled state shows the svg of each item.
  final String fillSvg;

  /// The label identifies each item and is essential.
  final String label;

  /// The index identifies each item and is necessary.
  final int index;

  /// Returns the current index of each item.
  final int currentIndex;

  /// Click on any item to move the desired index.
  final Function(int) onTap;

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
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
            onTap(index);
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                margin: const EdgeInsets.only(top: 4),
                duration: const Duration(milliseconds: 350),
                padding: EdgeInsets.all(currentIndex == index ? 3.5 : 0),
                decoration: BoxDecoration(
                    color: dotColor ?? Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
              ),
              const SizedBox(height: 5,),
              SvgPicture.asset(
                  currentIndex == index
                      ? fillSvg
                      : emptySvg,
                  height: iconSize ?? 24,
                  color: currentIndex == index
                      ? (selectedColor ?? Theme.of(context).primaryColor)
                      : (unselectedColor ?? Colors.grey)),
              label.isEmpty ? const SizedBox() : Text(label,style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 11,
                color: currentIndex == index
                    ? (selectedColor ?? Theme.of(context).primaryColor)
                    : (unselectedColor ?? Colors.grey)
              )),

            ],
          ),
        ),
      ),
    );
  }
}

