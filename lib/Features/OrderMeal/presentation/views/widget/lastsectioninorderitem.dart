import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriescubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeordercubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeorderstate.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/ordersummaryview.dart';
import 'package:orderapp/utilites/customwidget/custombutton.dart';

class LastSectionInOrderItem extends StatelessWidget {
  const LastSectionInOrderItem({super.key, required this.cal});
  final double cal;



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceorderCubit, PlaceorderState>(
      builder: (context, state) {
        final cubit = context.read<PlaceorderCubit>();
        final canPlace = cubit.canPlaceOrder();

        return Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Calories'),
                    Text(
                      '${cubit.totalCalories.round()} Cal out of ${cal.round()} Cal',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Price'),
                    Text(
                      '\$${cubit.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Custombutton(
                color: canPlace ? const Color(0xffF25700) : Colors.grey,
                onPressed:
                    canPlace
                        ? () {
                          final placedIngredients = cubit.selectedIngredients;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => Ordersummaryview(
                                    cal: cal,
                                    totalCalories: cubit.totalCalories ?? 0.0,
                                    placedIngredients: placedIngredients,
                                    caloriesCubit:
                                        context.read<CaloriesCubit>(),
                                    price: cubit.totalPrice,
                                    ingredientCounts:
                                        cubit.ingredientCounts,
                                  ),
                            ),
                          );
                        }
                        : null,
                title: 'Place Order',
              ),
            ],
          ),
        );
      },
    );
  }
}
