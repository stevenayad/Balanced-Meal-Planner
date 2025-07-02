part of 'order_summary_cubit.dart';


@immutable
sealed class OrderSummaryState {}

class OrderSummaryInitial extends OrderSummaryState {}

class OrderSummaryLoading extends OrderSummaryState {}

class OrderSummaryUpdated extends OrderSummaryState {
  final List<Ingredient> orders;
  final Map<Ingredient, int> counts;
  
  OrderSummaryUpdated(this.orders, [this.counts = const {}]);
}

class OrderSummaryError extends OrderSummaryState {
  final String message;
  OrderSummaryError(this.message);
}