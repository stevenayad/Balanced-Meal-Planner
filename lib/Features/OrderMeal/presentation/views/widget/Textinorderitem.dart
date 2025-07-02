import 'package:flutter/material.dart';

class Textinorderitem extends StatelessWidget {
  const Textinorderitem({super.key, required this.tittle});
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        tittle,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
