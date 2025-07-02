


abstract class Caloriesstate {}

class CaloriesInitial extends Caloriesstate {}

class CaloriesLoading extends Caloriesstate {}

class CaloriesSuccess extends Caloriesstate {

}

class IngredientError extends Caloriesstate {
  final String message;

  IngredientError(this.message);
}


class CaloriesCalculated extends  Caloriesstate{
  final double calories;

  CaloriesCalculated(this.calories);
}



class CaloriesUpdateState extends  Caloriesstate{
  final String height;
  final String weight;
  final String age;
  final String? gender;

  CaloriesUpdateState({
    required this.height,
    required this.weight,
    required this.age,
    this.gender,
  });
}