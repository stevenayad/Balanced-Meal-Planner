import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriescubit.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriesstate.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/Orderitemview.dart';
import 'package:orderapp/Features/OrderMeal/presentation/views/widget/Genderinputfeild.dart';
import 'package:orderapp/utilites/customwidget/customTextformFeild.dart';
import 'package:orderapp/utilites/customwidget/custombutton.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({super.key});

  void _handleNext(BuildContext context) {
    final cubit = context.read<CaloriesCubit>();
    final calories = cubit.calculateCalories();
    if (calories != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => Orderitemview(Calories: calories),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaloriesCubit, Caloriesstate>(
      builder: (context, state) {
        final cubit = context.read<CaloriesCubit>();

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gender Section
              const Text(
                'Gender',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              GenderInputField(
                onGenderSelected: (gender) => cubit.setGender(gender),
              ),

              // Height Section
              const SizedBox(height: 8),
              const Text(
                'Height',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              HeightInputField(
                controller: cubit.heightController,
                hintText: 'Enter your Height',
                suffixText: 'Cm',
                onChanged: (_) => cubit.emit(CaloriesInitial()),
              ),

              const SizedBox(height: 8),
              const Text(
                'Weight',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              HeightInputField(
                controller: cubit.weightController,
                hintText: 'Enter your Weight',
                suffixText: 'Kg',
                onChanged: (_) => cubit.emit(CaloriesInitial()),
              ),

              // Age Section
              const SizedBox(height: 8),
              const Text(
                'Age',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              HeightInputField(
                controller: cubit.ageController,
                hintText: 'Enter your Age',
                onChanged: (_) => cubit.emit(CaloriesInitial()),
              ),

              const SizedBox(height: 40),
              BlocBuilder<CaloriesCubit, Caloriesstate>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Custombutton(
                      onPressed: () {
                        if (cubit.allFieldsFilled) {
                          _handleNext(context);
                        }
                      },
                      title: 'Next',
                      color:
                          cubit.allFieldsFilled
                              ? const Color(0xffF25700)
                              : Colors.grey,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
