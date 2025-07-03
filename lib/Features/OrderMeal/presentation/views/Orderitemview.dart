import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/foodCubit/foodcubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeordercubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/orderitembody.dart';
import 'package:orderapp/utilites/customwidget/customappbar.dart';
import 'package:orderapp/Services/firebaseServices.dart';

class Orderitemview extends StatelessWidget {
  const Orderitemview({super.key, required this.Calories});
  final double Calories;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => OrderSummaryCubit()),
        BlocProvider(
          create:
              (_) => IngredientCubit(FirebaseService())..fetchAllIngredients(),
        ),
        BlocProvider(create: (_) => PlaceorderCubit(targetCalories: Calories)),
      ],
      child: Scaffold(
        appBar: CustomProfileAppBar(title: "Create your order"),
        body: OrderItemBody(cal: Calories),
      ),
    );
  }
}
