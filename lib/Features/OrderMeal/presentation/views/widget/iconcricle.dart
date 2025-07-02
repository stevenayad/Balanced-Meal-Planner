import 'package:flutter/material.dart';

class IconCircle extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final void Function()? onTap;

  const IconCircle({
    super.key,
    required this.icon,
    this.size = 30,
    this.backgroundColor = const Color(0xffF25700), 
    this.iconColor = Colors.white, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor, 
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon, 
            size: size * 0.6, 
            color: iconColor,
          ),
        ),
      ),
    );
  }
}