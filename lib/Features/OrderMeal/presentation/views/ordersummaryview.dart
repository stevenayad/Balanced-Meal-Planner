import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/data/Repo/Checkoutimpelwmtation.dart';
import 'package:orderapp/Features/OrderMeal/data/Repo/Checkoutrepo.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriescubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/ordercheckout/ordercheckout_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeordercubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/orderSummarybody.dart';
import 'package:orderapp/utilites/customwidget/customappbar.dart';

class Ordersummaryview extends StatelessWidget {
  final CaloriesCubit caloriesCubit;
  final double cal;
  final List<Ingredient> placedIngredients;
  final double totalCalories;
  final double price;
  final Map<Ingredient, int> ingredientCounts;

  const Ordersummaryview({
    super.key,
    required this.caloriesCubit,
    required this.cal,
    required this.placedIngredients,
    required this.totalCalories,
    required this.price,
    required this.ingredientCounts,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => OrderSummaryCubit(initialOrders: placedIngredients),
        ),
        BlocProvider(create: (_) => PlaceorderCubit()),
        BlocProvider(
          create: (_) => OrdercheckoutCubit(Checkoutimpelwmtation()),
        ),
      ],
      child: Scaffold(
        appBar: CustomProfileAppBar(title: 'Order Summary'),
        body: SafeArea(
          child: OrderSummaryBody(
            ingredientCounts: ingredientCounts,
            cal: cal,
            totalCalories: totalCalories,
            price: price,
          ),
        ),
      ),
    );
  }
}
