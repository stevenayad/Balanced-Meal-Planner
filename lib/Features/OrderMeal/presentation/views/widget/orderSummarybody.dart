import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
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
  final Map<Ingredient, int> ingredientCounts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Main content sliver
        SliverToBoxAdapter(
          child: ListViewInOrderSummary(),
        ),
        
        // Last section sliver (will scroll with content)
        SliverToBoxAdapter(
          child: lastSectioniSummaryorder(
            cal: cal,
            totalcal: totalCalories,
            price: price,
            ingredientCounts: ingredientCounts,
          ),
        ),
        
        // Add bottom padding
        SliverPadding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
        ),
      ],
    );
  }
}