import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';


abstract class PlaceorderState {}

class PlaceorderInitial extends PlaceorderState {}

class PlaceorderLoading extends PlaceorderState {}

class PlaceorderUpdated extends PlaceorderState {
  final List<Ingredient> selectedIngredients;
  final double totalPrice;
  final double totalCalories;
  final double? targetCalories;
  final Map<Ingredient, int> ingredientCounts;

  PlaceorderUpdated(
    this.selectedIngredients,
    this.totalPrice,
    this.totalCalories, {
    this.targetCalories,
    required this.ingredientCounts,
  });
}

class PlaceorderSuccess extends PlaceorderState {
  final double totalPrice;
  final double totalCalories;
  final List<Ingredient> selectedIngredients;
  final double targetCalories;
  final Map<Ingredient, int> ingredientCounts;

  PlaceorderSuccess(
    this.totalPrice,
    this.totalCalories,
    this.selectedIngredients, {
    required this.targetCalories,
    required this.ingredientCounts,
  });
}

class PlaceorderError extends PlaceorderState {
  final String message;
  PlaceorderError(this.message);
}
 