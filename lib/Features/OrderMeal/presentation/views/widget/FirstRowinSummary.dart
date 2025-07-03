import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/utilites/Appstyles.dart';

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
            style: Appstyles.fontsize16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          'Price: ${ingredient.price} ',
          style: Appstyles.fontsize16.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
