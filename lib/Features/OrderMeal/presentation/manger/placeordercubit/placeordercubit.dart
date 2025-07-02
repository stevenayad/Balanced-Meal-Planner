import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/placeordercubit/placeorderstate.dart';

class PlaceorderCubit extends Cubit<PlaceorderState> {
  final double? targetCalories;
  final List<Ingredient> _selectedIngredients = [];
  final Map<Ingredient, int> _ingredientCounts = {};

  PlaceorderCubit({this.targetCalories}) : super(PlaceorderInitial());

  // Getters
  List<Ingredient> get selectedIngredients => List.from(_selectedIngredients);
  Map<Ingredient, int> get ingredientCounts => Map.from(_ingredientCounts);
  
  double get totalCalories => _ingredientCounts.entries.fold(
    0,
    (sum, entry) => sum + (entry.key.calories * entry.value),
  );

  double get totalPrice => _ingredientCounts.entries.fold(
    0,
    (sum, entry) => sum + (entry.key.price * entry.value),
  );

  int getIngredientCount(Ingredient ingredient) {
    return _ingredientCounts[ingredient] ?? 0;
  }

  bool canPlaceOrder() {
    if (targetCalories == null) {
      debugPrint("Target calories is null - fields may not be filled");
      return false;
    }

    final lower = targetCalories! * 0.9;
    final upper = targetCalories! * 1.1;
    final currentCalories = totalCalories;

    return currentCalories >= lower && currentCalories <= upper;
  }

  void addIngredient(Ingredient ingredient) {
    _selectedIngredients.add(ingredient);
    _ingredientCounts.update(
      ingredient,
      (count) => count + 1,
      ifAbsent: () => 1,
    );
    emit(
      PlaceorderUpdated(
        List.from(_selectedIngredients),
        totalPrice,
        totalCalories,
        targetCalories: targetCalories,
        ingredientCounts: Map.from(_ingredientCounts),
      ),
    );
  }

  void removeIngredient(Ingredient ingredient) {
    _selectedIngredients.remove(ingredient);
    if (_ingredientCounts.containsKey(ingredient)) {
      if (_ingredientCounts[ingredient]! > 1) {
        _ingredientCounts[ingredient] = _ingredientCounts[ingredient]! - 1;
      } else {
        _ingredientCounts.remove(ingredient);
      }
    }
    emit(
      PlaceorderUpdated(
        List.from(_selectedIngredients),
        totalPrice,
        totalCalories,
        targetCalories: targetCalories,
        ingredientCounts: Map.from(_ingredientCounts),
      ),
    );
  }

  void placeOrder() {
    emit(PlaceorderLoading());
    try {
      if (canPlaceOrder()) {
        emit(
          PlaceorderSuccess(
            totalPrice,
            totalCalories,
            List.from(_selectedIngredients),
            targetCalories: targetCalories!,
            ingredientCounts: Map.from(_ingredientCounts),
          ),
        );
      } else {
        emit(PlaceorderError('Cannot place order - calories out of range'));
      }
    } catch (e) {
      emit(PlaceorderError('Error placing order: ${e.toString()}'));
    }
  }

  void clearOrder() {
    _selectedIngredients.clear();
    _ingredientCounts.clear();
    emit(PlaceorderInitial());
  }
}