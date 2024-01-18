import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trending_app/extensions.dart';
import 'package:trending_app/widgets/rounded_container_with_icon.dart';
import 'package:trending_app/widgets/rounded_container_with_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:18.0),
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                        child: SvgPicture.asset('assets/avtar.svg')
                    )
                ),),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                        child: Icon(Icons.settings,color: context.isDarkMode?Colors.white: Colors.blue,)
                    )
                ),),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12)),
                child: const SizedBox(
                    width: 40,
                    height: 40,
                    child: ClipOval(
                        child: Icon(Icons.notifications,color: Colors.blue,)
                    )
                ),),
            ],),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [Row(
                  children: [
                    const Text(
                      'My wallet',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    RoundedContainerWithText()
                  ],
                ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30.0),
                    child: Text(
                      '\$3,400.00',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RoundedContainerWithLeading(text: 'Transfer',color: context.isDarkMode?Colors.black: Colors.white24),
                      const RoundedContainerWithLeading(text: 'Deposit',color: Colors.white24),
                      const RoundedContainerWithLeading(text: 'Swap',color: Colors.white24),
                    ],
                  )],
              ),
            ),
          )
        ],
      ),
    );
  }
}
