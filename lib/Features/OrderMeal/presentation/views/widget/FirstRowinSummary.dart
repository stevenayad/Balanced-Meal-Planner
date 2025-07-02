import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';

class FirstRowinorderSummary extends StatelessWidget {
  const FirstRowinorderSummary({super.key, required this.ingredient});
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            ingredient.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '${ingredient.price}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
