import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/foodCubit/foodcubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/foodCubit/foodstate.dart';
import 'listvieworderitem.dart';
import 'textinorderitem.dart';
import 'lastsectioninorderitem.dart';

class OrderItemBody extends StatelessWidget {
  const OrderItemBody({super.key, required this.cal});
  final double cal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientCubit, IngredientState>(
      builder: (context, state) {
        if (state is IngredientLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is IngredientSuccess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...state.categorizedIngredients.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textinorderitem(tittle: entry.key),
                      const SizedBox(height: 12),
                      ListViewOrderItem(ingredients: entry.value),
                    ],
                  );
                }).toList(),
                const SizedBox(height: 10),
                LastSectionInOrderItem(cal: cal),
              ],
            ),
          );
        } else if (state is IngredientError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
