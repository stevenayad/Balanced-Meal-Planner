import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';

class imageorderSummary extends StatelessWidget {
  const imageorderSummary({super.key, required this.ingredient});
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 80,
        child: Image.network(
          ingredient.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 100,
              color: Colors.grey.shade300,
              child: const Center(
                child: Icon(Icons.broken_image, color: Colors.grey),
              ),
            );
          },
        ),
      ),
    );
  }
}
