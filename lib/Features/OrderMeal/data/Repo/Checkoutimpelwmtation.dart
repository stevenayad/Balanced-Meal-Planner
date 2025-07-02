import 'package:dartz/dartz.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Inputordermodel.dart';
import 'package:orderapp/Features/OrderMeal/data/Repo/Checkoutrepo.dart';
import 'package:orderapp/Services/orderServices.dart';
import 'package:orderapp/utilites/faliures.dart';

class Checkoutimpelwmtation extends Checkoutrepo {
  final OrderServices orderServices = OrderServices();

  @override
  Future<Either<Faliure, void>> makeorder({
    required Inputordermodel inputorder,
  }) async {
    try {
      final result = await orderServices.makeOrder(inputorder);
      if (result) {
        return Right(null); 
      } else {
        return Left(ServerFailure(errMessage: 'Server unreachable'));
      }
    } catch (e) {
      return Left(ServerFailure(errMessage: 'Server unreachable'));
    }
  }
}
