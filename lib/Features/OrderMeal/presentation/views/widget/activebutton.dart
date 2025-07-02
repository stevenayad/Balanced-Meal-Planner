import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeordercubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/iconcricle.dart';
import 'package:orderapp/utilites/customwidget/custombutton.dart';
class Activebutton extends StatefulWidget {
  const Activebutton({super.key, required this.ingredient});
  final Ingredient ingredient;

  @override
  State<Activebutton> createState() => _ActivebuttonState();
}

class _ActivebuttonState extends State<Activebutton> {
  bool isClicked = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final placeOrderCubit = context.read<PlaceorderCubit>();
    final orderSummaryCubit = context.read<OrderSummaryCubit>();
    final currentCount = orderSummaryCubit.getIngredientCount(widget.ingredient);

    return Row(
      children: [
        if (!isClicked)
          Custombutton(
            color: Color(0xffF25700),
            title: 'Add',
            onPressed: () {
              placeOrderCubit.addIngredient(widget.ingredient);
              orderSummaryCubit.addOrder(widget.ingredient);
              orderSummaryCubit.incrementIngredientCount(widget.ingredient);
              setState(() {
                isClicked = true;
                quantity = currentCount + 1;
              });
            },
          )
        else ...[
          IconCircle(
            icon: Icons.remove,
            onTap: () {
              setState(() {
                if (quantity > 1) {
                  placeOrderCubit.removeIngredient(widget.ingredient);
                  orderSummaryCubit.decrementIngredientCount(widget.ingredient);
                  quantity--;
                } else {
                  placeOrderCubit.removeIngredient(widget.ingredient);
                  orderSummaryCubit.removeOrder(widget.ingredient);
                  isClicked = false;
                }
              });
            },
          ),
          const SizedBox(width: 4),
          Text(
            '$quantity',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          IconCircle(
            icon: Icons.add,
            onTap: () {
              placeOrderCubit.addIngredient(widget.ingredient);
              orderSummaryCubit.incrementIngredientCount(widget.ingredient);
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      ],
    );
  }
}