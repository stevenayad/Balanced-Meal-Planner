import 'package:flutter/material.dart';
import 'package:orderapp/utilites/Appstyles.dart';

class Textinorderitem extends StatelessWidget {
  const Textinorderitem({super.key, required this.tittle});
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        tittle,
        style: Appstyles.fontsize20.copyWith(color: Color(0xff1E1E1E)),
      ),
    );
  }
}
