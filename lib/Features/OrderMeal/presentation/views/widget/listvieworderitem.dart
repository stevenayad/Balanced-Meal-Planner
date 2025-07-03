import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/orderitem.dart';

class ListViewOrderItem extends StatelessWidget {
  final List<Ingredient> ingredients;

  const ListViewOrderItem({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ingredients.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OrderItemCard(ingredient: ingredients[index]),
          );
        },
      ),
    );
  }
}
