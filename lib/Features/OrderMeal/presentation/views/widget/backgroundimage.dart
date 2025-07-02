import 'package:flutter/material.dart';

class Backgroundimage extends StatelessWidget {
  const Backgroundimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/5cd78b62e9855eaaf7d474ac3e0d21936a5d75d9.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
