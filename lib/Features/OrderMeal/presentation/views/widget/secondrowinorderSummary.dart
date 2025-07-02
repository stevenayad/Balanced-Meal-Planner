import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';

class SecondRowInOrderSummary extends StatelessWidget {
  const SecondRowInOrderSummary({
    super.key,
    required this.ingredient,
    required this.count,
  });

  final Ingredient ingredient;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${ingredient.calories} Cal',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 4),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ],
    );
  }
}
