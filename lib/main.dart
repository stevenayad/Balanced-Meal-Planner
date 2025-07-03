import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriescubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/orderSummaryCubit/cubit/order_summary_cubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeordercubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/HomeScreenview.dart';
import 'package:orderapp/Services/firebaseServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();

  runApp(const BalancedMealApp());
}

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CaloriesCubit()),

        BlocProvider<PlaceorderCubit>(create: (_) => PlaceorderCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Balanced Meal',
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Poppins'),
            bodyMedium: TextStyle(fontFamily: 'Poppins'),
            titleLarge: TextStyle(fontFamily: 'Poppins'),
          ),
        ),

        home: const Homescreenview(),
      ),
    );
  }
}
