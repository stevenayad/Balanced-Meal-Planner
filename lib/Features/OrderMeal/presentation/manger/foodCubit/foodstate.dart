import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';

abstract class IngredientState {}

class IngredientInitial extends IngredientState {}

class IngredientLoading extends IngredientState {}

class IngredientSuccess extends IngredientState {
  final Map<String, List<Ingredient>> categorizedIngredients;

  IngredientSuccess(this.categorizedIngredients);
}

class IngredientError extends IngredientState {
  final String message;

  IngredientError(this.message);
}
