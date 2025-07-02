import 'package:flutter/material.dart';

class imageorderitem extends StatelessWidget {
  const imageorderitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 6,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Image.asset(
          'assets/images/5cd78b62e9855eaaf7d474ac3e0d21936a5d75d9.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}
