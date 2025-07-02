class Inputordermodel {
  final List<InputOrderItem> items;
  Inputordermodel({required this.items});

  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }
}

class InputOrderItem {
  final String name;
  final num total_price;
  final int quantity;

  InputOrderItem({
    required this.name,
    required this.total_price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'total_price': total_price, 'quantity': quantity};
  }
}
