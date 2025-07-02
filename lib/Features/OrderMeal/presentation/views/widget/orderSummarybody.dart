import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/lastsectioninorderitem.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/lastsectioninordersumary.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/listviewinorderSummary.dart';

class OrderSummaryBody extends StatelessWidget {
  const OrderSummaryBody({
    super.key,
    required this.cal,
    required this.totalCalories,
    required this.price,
    required this.ingredientCounts,
  });
  final double cal;
  final double totalCalories;
  final double price;
  final Map<Ingredient, int> ingredientCounts; // <-- add thi
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListViewInOrderSummary()),
        lastSectioniSummaryorder(
          cal: cal,
          totalcal: totalCalories,
          price: price,
          ingredientCounts: ingredientCounts,
        ),
      ],
    );
  }
}
