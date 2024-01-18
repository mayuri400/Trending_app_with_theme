import 'package:flutter/material.dart';
import 'package:trending_app/UI/home_screen.dart';
import 'package:trending_app/UI/wallet.dart';
import 'package:trending_app/extensions.dart';
import 'package:trending_app/widgets/bottom_navigation_bar/dot_bottom_nav_bar.dart';
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    HomeScreen(),
    Wallet(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:_pages[_selectedIndex],
        bottomNavigationBar: DotBottomNavBar(
            currentIndex: _selectedIndex,
            dotColor: Colors.blue,
            onTap: (value) =>_onItemTapped(value),
            selectedColor: Colors.blue,
            iconSize: 40,
            unselectedColor: Colors.grey.shade500,
            boxShadow: BoxShadow( color: Colors.grey.shade200,
              spreadRadius: context.isDarkMode?0.1:0.5),
            backgroundColor: context.isDarkMode?Colors.black:Colors.white,
            items: [
              BottomNavItem(
                  emptySvg: "assets/home.svg",
                  fillSvg: "assets/home_fill.svg",
                  label: ""),
              BottomNavItem(
                  emptySvg: "assets/wallet.svg",
                  fillSvg: "assets/wallet_fill.svg",
                  label: ""),
              BottomNavItem(
                  emptySvg: "assets/svg1.svg",
                  fillSvg: "assets/svg1.svg",
                  label: ""),
              BottomNavItem(
                  emptySvg: "assets/svg2.svg",
                  fillSvg: "assets/svg2.svg",
                  label: ""),
            ]),
      ),
    );
  }
}
