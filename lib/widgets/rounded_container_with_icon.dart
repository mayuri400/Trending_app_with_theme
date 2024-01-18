import 'package:flutter/material.dart';
class RoundedContainerWithLeading extends StatelessWidget {
  final String text;
  final Color color;

  const RoundedContainerWithLeading({super.key,
    required this.text,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.transform,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 3,),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}