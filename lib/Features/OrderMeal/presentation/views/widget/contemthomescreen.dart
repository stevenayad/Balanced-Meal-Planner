import 'package:flutter/material.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/userDetailsscreenview.dart';
import 'package:orderapp/utilites/Appstyles.dart';
import 'package:orderapp/utilites/customwidget/custombutton.dart';

class contenthome extends StatelessWidget {
  const contenthome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.4),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text('Balanced Meal', style: Appstyles.fontsize40),
          const Spacer(),
          Text(
            'Craft your ideal meal effortlessly \n '
            'with our app Select nutritious \n '
            'ingredients tailored to your taste\n'
            'and well-being.',
            style: Appstyles.fontsize20.copyWith(fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40.0),
          SizedBox(
            width: 327,
            height: 60,
            child: Custombutton(
              title: 'Order Food',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Userdetailsscreenview(),
                  ),
                );
              },
              color: Color(0xffF25700),
            ),
          ),
        ],
      ),
    );
  }
}
