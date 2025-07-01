import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';

class SelectedItem {
  final MealDataModel meal;
  int quantity;

  SelectedItem({required this.meal, this.quantity = 1});

  num get totalPrice => meal.price * quantity;
  num get totalCalories => meal.calories * quantity;
}

class OrderState {
  final Map<String, SelectedItem> items;

  OrderState({required this.items});

  OrderState copyWith({Map<String, SelectedItem>? items}) {
    return OrderState(items: items ?? this.items);
  }

  num get totalCalories => items.values.fold(0, (sum, item) => sum + item.totalCalories);

  double get totalPrice => items.values.fold(0.0, (sum, item) => sum + item.totalPrice);

  bool canPlaceOrder(int requiredCalories) {
    return totalCalories >= requiredCalories * 0.9 &&
        totalCalories <= requiredCalories * 1.1;
  }
}
