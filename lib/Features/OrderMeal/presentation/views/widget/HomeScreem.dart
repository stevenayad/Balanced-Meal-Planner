import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/backgroundimage.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/contemthomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [Backgroundimage(), contenthome()]);
  }
}
