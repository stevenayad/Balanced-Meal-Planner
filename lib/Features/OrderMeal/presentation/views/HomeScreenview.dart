import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/HomeScreem.dart';

class Homescreenview extends StatelessWidget {
  const Homescreenview({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint(DefaultTextStyle.of(context).style.fontFamily);
    return Scaffold(body: HomeScreen());
  }
}
