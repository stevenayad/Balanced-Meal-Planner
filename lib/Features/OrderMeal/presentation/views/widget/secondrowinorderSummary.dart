import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/utilites/Appstyles.dart';

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
          style: Appstyles.fontsize14.copyWith(fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            const SizedBox(width: 4),
            Text(
              '${count} pieces',
              style: Appstyles.fontsize16.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ],
    );
  }
}
