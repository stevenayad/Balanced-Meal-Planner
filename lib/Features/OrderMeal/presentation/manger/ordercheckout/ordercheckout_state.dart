part of 'ordercheckout_cubit.dart';

@immutable
sealed class OrdercheckoutState {}

final class OrdercheckoutInitial extends OrdercheckoutState {}

final class OrdercheckoutLoading extends OrdercheckoutState {}

final class OrdercheckoutFaliure extends OrdercheckoutState {
  final String errorMessage;

  OrdercheckoutFaliure( {required this.errorMessage});
}

final class OrdercheckoutScuccess extends OrdercheckoutState {}
