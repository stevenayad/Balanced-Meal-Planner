import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:orderapp/Features/OrderMeal/data/Models/Intergretis.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit({List<Ingredient>? initialOrders})
    : super(OrderSummaryInitial()) {
    if (initialOrders != null) {
      // Group initial orders and count duplicates
      final counts = <Ingredient, int>{};
      for (var ingredient in initialOrders) {
        counts[ingredient] = (counts[ingredient] ?? 0) + 1;
      }
      _orders.addAll(initialOrders);
      _orderCounts.addAll(counts);
      emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
    }
  }
  final List<Ingredient> _orders = [];
  final Map<Ingredient, int> _orderCounts = {};

  List<Ingredient> get orders => List.from(_orders);
  int get orderslength => _orders.length;

  void addOrder(Ingredient ingredient) {
    try {
      _orders.add(ingredient);
      _orderCounts.update(ingredient, (count) => count + 1, ifAbsent: () => 1);
      emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
    } catch (e, stackTrace) {
      emit(OrderSummaryError('Failed to add item: $e'));
      addError(e, stackTrace);
    }
  }

  void removeOrder(Ingredient ingredient) {
    try {
      if (!_orders.contains(ingredient)) {
        throw Exception('Item not found in orders');
      }
      _orders.remove(ingredient);
      _orderCounts.remove(ingredient);
      emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
    } catch (e, stackTrace) {
      emit(OrderSummaryError('Failed to remove item: $e'));
      addError(e, stackTrace);
    }
  }

  void clearOrders() {
    try {
      _orders.clear();
      _orderCounts.clear();
      emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
    } catch (e, stackTrace) {
      emit(OrderSummaryError('Failed to clear orders: $e'));
      addError(e, stackTrace);
    }
  }

  Future<void> fetchOrders() async {
    try {
      emit(OrderSummaryLoading());
      await Future.delayed(const Duration(milliseconds: 100));
      emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
    } catch (e, stackTrace) {
      emit(OrderSummaryError('Failed to fetch orders: $e'));
      addError(e, stackTrace);
    }
  }

  void incrementIngredientCount(Ingredient ingredient) {
    _orderCounts.update(ingredient, (count) => count + 1, ifAbsent: () => 1);
    emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
  }

  void decrementIngredientCount(Ingredient ingredient) {
    if (!_orderCounts.containsKey(ingredient)) return;

    if (_orderCounts[ingredient]! > 1) {
      _orderCounts[ingredient] = _orderCounts[ingredient]! - 1;
    } else {
      _orderCounts.remove(ingredient);
      _orders.remove(ingredient); // Also remove from orders list
    }
    emit(OrderSummaryUpdated(List.from(_orders), Map.from(_orderCounts)));
  }

  int getIngredientCount(Ingredient ingredient) {
    return _orderCounts[ingredient] ?? 0;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }
}