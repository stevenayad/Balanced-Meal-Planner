import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';
import 'package:orderapp/Features/OrderMeal/presentation/manger/foodCubit/foodstate.dart';
import 'package:orderapp/Services/firebaseServices.dart';

class IngredientCubit extends Cubit<IngredientState> {
  final FirebaseService _firebaseService;

  IngredientCubit(this._firebaseService) : super(IngredientInitial());

  Future<void> fetchAllIngredients() async {
    emit(IngredientLoading());

    try {
      List<Ingredient> allIngredients =
          await _firebaseService.fetchIngredients();
      Map<String, List<Ingredient>> categorized = {
        'Vegetable': [],
        'Meat': [],
        'Carb': [],
      };

      for (var ing in allIngredients) {
        categorized[ing.category]?.add(ing);
      }

      emit(IngredientSuccess(categorized));
    } catch (e, stacktrace) {
      print('Error loading ingredients: $e');
      print(stacktrace);
      emit(IngredientError("Failed to load ingredients"));
    }
  }
}
