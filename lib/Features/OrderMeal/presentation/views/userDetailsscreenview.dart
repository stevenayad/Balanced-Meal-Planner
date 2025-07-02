import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriescubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/UserDetailsScreen.dart';
import 'package:orderapp/utilites/customwidget/customappbar.dart';

class Userdetailsscreenview extends StatelessWidget {
  const Userdetailsscreenview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CaloriesCubit(),
        child: const UserDetailsView(),
      ),
      appBar: CustomProfileAppBar(title: 'Enter your details'),
    );
  }
}
