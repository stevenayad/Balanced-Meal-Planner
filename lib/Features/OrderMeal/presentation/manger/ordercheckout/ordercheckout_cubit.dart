import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Inputordermodel.dart';
import 'package:orderapp/Features/OrderMeal/data/Repo/Checkoutrepo.dart';

part 'ordercheckout_state.dart';

class OrdercheckoutCubit extends Cubit<OrdercheckoutState> {
  OrdercheckoutCubit(this.checkoutrepo) : super(OrdercheckoutInitial());
  final Checkoutrepo checkoutrepo ;

  Future<void> makepayment({
    required Inputordermodel inputorderModel,
  }) async {
    emit(OrdercheckoutLoading());

    final result = await checkoutrepo.makeorder(
      inputorder: inputorderModel,
    );

    result.fold(
      (failure) => emit(OrdercheckoutFaliure(errorMessage: failure.errMessage)),
      (_) => emit(OrdercheckoutScuccess()),
    );
  }


}