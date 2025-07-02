import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/FoodItemcard.dart';
class ListViewInOrderSummary extends StatefulWidget {
  const ListViewInOrderSummary({super.key});

  @override
  State<ListViewInOrderSummary> createState() => _ListViewInOrderSummaryState();
}

class _ListViewInOrderSummaryState extends State<ListViewInOrderSummary> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderSummaryCubit>().fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
      builder: (context, state) {
        if (state is OrderSummaryUpdated) {
          // Group items by ingredient and get unique items with their counts
          final uniqueItems = <Ingredient, int>{};
          for (var ingredient in state.orders) {
            uniqueItems.update(
              ingredient,
              (count) => count + 1,
              ifAbsent: () => 1,
            );
          }

          return ListView.builder(
            itemCount: uniqueItems.length,
            itemBuilder: (context, index) {
              final ingredient = uniqueItems.keys.elementAt(index);
              final count = uniqueItems[ingredient]!;
              return FoodItemCard(
                ingredient: ingredient,
                count: count,
              );
            },
          );
        } else if (state is OrderSummaryError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}