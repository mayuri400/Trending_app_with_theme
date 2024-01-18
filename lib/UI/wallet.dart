import 'package:flutter/material.dart';
import 'package:trending_app/extensions.dart';
import 'package:trending_app/widgets/rounded_container_with_icon.dart';
import 'package:trending_app/widgets/rounded_container_with_text.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical:10,horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'My Wallet',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium
          ),
          SizedBox(height: 10,),
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
                      'Wallet Balance',
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
                      RoundedContainerWithLeading(text: 'Transfer',color: Colors.black),
                       RoundedContainerWithLeading(text: 'Deposit',color: Colors.white24),
                       RoundedContainerWithLeading(text: 'Swap',color: Colors.white24),
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
