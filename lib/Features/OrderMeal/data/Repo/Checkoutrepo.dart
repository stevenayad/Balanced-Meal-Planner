import 'package:dartz/dartz.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Inputordermodel.dart';
import 'package:orderapp/utilites/faliures.dart';

abstract class Checkoutrepo {
  Future<Either<Faliure, void>> makeorder({
    required Inputordermodel inputorder,
  });
}
