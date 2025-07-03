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
          return CustomScrollView(
            slivers: [
              // Build slivers for each category
              ...state.categorizedIngredients.entries.map((entry) {
                return SliverList(
                  delegate: SliverChildListDelegate([
                    Textinorderitem(tittle: entry.key),
                    const SizedBox(height: 12),
                    ListViewOrderItem(ingredients: entry.value),
                    const SizedBox(height: 16),
                  ]),
                );
              }).toList(),

              // Add the last section
              SliverToBoxAdapter(child: LastSectionInOrderItem(cal: cal)),

              // Add bottom padding
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                ),
              ),
            ],
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


/*import 'package:flutter/material.dart';
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
          return Scaffold(
            body: Stack(
              children: [
                // Scrollable content
                SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    bottom: 120,
                  ), // Space for fixed bottom section
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
                      const SizedBox(
                        height: 120,
                      ), // Extra space to prevent overlap
                    ],
                  ),
                ),

                // Fixed bottom section
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LastSectionInOrderItem(cal: cal),
                ),
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
}*/
