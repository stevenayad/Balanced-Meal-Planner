import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Inputordermodel.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/ordercheckout/ordercheckout_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/HomeScreenview.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/ordersummaryview.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/HomeScreem.dart';
import 'package:orderapp/utilites/customwidget/custombutton.dart';

class lastSectioniSummaryorder extends StatelessWidget {
  const lastSectioniSummaryorder({
    super.key,
    required this.cal,
    required this.totalcal,
    required this.price,
    required this.ingredientCounts,
  });
  final double cal;
  final double totalcal;
  final double price;
  final Map<Ingredient, int> ingredientCounts;

  @override
  Widget build(BuildContext context) {
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
                  '${totalcal} Cal out of ${cal.round()} Cal',
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
                  '\$${price}',
                  style: TextStyle(
                    color: Colors.orange[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BlocListener<OrdercheckoutCubit, OrdercheckoutState>(
            listener: (context, state) {
              if (state is OrdercheckoutScuccess) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => Homescreenview()),
                  (route) => false,
                );
              } else if (state is OrdercheckoutFaliure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: Custombutton(
              color: Color(0xffF25700),
              onPressed: () {
                final items =
                    ingredientCounts.entries.map((entry) {
                      final ingredient = entry.key;
                      final count = entry.value;
                      return InputOrderItem(
                        name: ingredient.name,
                        total_price: ingredient.price * count,
                        quantity: count,
                      );
                    }).toList();

                final inputOrderModel = Inputordermodel(items: items);

                BlocProvider.of<OrdercheckoutCubit>(
                  context,
                ).makepayment(inputorderModel: inputOrderModel);
              },
              title: 'Check out',
              isEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
