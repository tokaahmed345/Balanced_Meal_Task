class OrderItem {
  final String name;
  final num totalPrice;
  final int quantity;

  OrderItem({
    required this.name,
    required this.totalPrice,
    required this.quantity,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'],
      totalPrice: (json['total_price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "total_price": totalPrice,
      "quantity": quantity,
    };
  }
}
