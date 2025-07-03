import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/activebutton.dart';
import 'package:orderapp/utilites/Appstyles.dart';

class OrderItemCard extends StatelessWidget {
  final Ingredient ingredient;
  const OrderItemCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.4;

    return Container(
      width: cardWidth.clamp(150, 180),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ingredient.imageUrl,
            height: 100,
            width: double.infinity,
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
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        ingredient.name,
                        style: Appstyles.fontsize16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "${ingredient.calories} Cal",
                      style: Appstyles.fontsize14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff959595),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${ingredient.price}",
                      style: Appstyles.fontsize16.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Activebutton(ingredient: ingredient),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
