import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/FirstRowinSummary.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/imageorderSummary.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/secondrowinorderSummary.dart';
class FoodItemCard extends StatelessWidget {
  const FoodItemCard({
    super.key,
    required this.ingredient,
    required this.count,
  });
  
  final Ingredient ingredient;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            imageorderSummary(ingredient: ingredient),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FirstRowinorderSummary(ingredient: ingredient),
                  SecondRowInOrderSummary(
                    ingredient: ingredient,
                    count: count,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}