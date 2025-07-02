import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/Calories/Caloriesstate.dart';

class CaloriesCubit extends Cubit<Caloriesstate> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? _selectedGender;
  double? _calculatedCalories;

  CaloriesCubit() : super(CaloriesInitial());

  bool get allFieldsFilled => _selectedGender != null &&
      heightController.text.isNotEmpty &&
      weightController.text.isNotEmpty &&
      ageController.text.isNotEmpty;

  double? get height => double.tryParse(heightController.text);
  double? get weight => double.tryParse(weightController.text);
  int? get age => int.tryParse(ageController.text);
  double? get calculatedCalories => _calculatedCalories;

  void setGender(String gender) {
    _selectedGender = gender;
    emit(CaloriesUpdateState(
      height: heightController.text,
      weight: weightController.text,
      age: ageController.text,
      gender: _selectedGender,
    ));
  }

  void updateHeight(String value) {
    heightController.text = value;
    emit(CaloriesUpdateState(
      height: value,
      weight: weightController.text,
      age: ageController.text,
      gender: _selectedGender,
    ));
  }

  void updateWeight(String value) {
    weightController.text = value;
    emit(CaloriesUpdateState(
      height: heightController.text,
      weight: value,
      age: ageController.text,
      gender: _selectedGender,
    ));
  }

  void updateAge(String value) {
    ageController.text = value;
    emit(CaloriesUpdateState(
      height: heightController.text,
      weight: weightController.text,
      age: value,
      gender: _selectedGender,
    ));
  }

  double? calculateCalories() {
    if (!allFieldsFilled) {
      _calculatedCalories = null;
      return null;
    }

    if (_selectedGender!.toLowerCase() == 'male') {
      _calculatedCalories = 66.47 + (13.75 * weight!) + (5 * height!) - (6.75 * age!);
    } else {
      _calculatedCalories = 655.1 + (9.56 * weight!) + (1.85 * height!) - (4.67 * age!);
    }
    
    emit(CaloriesCalculated(_calculatedCalories!));
    return _calculatedCalories;
  }

  @override
  Future<void> close() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    return super.close();
  }
}
