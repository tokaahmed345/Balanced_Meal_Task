import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedItemCubit extends Cubit<OrderState> {
  SelectedItemCubit() : super(OrderState(items: {}));

  void addMeal(MealDataModel meal) {
    final currentItems = Map<String, SelectedItem>.from(state.items);

    if (currentItems.containsKey(meal.itemName)) {
      currentItems[meal.itemName]!.quantity++;
    } else {
      currentItems[meal.itemName] = SelectedItem(meal: meal);
    }

    emit(state.copyWith(items: currentItems));
  }

  void removeMeal(String itemName) {
    final currentItems = Map<String, SelectedItem>.from(state.items);

    if (!currentItems.containsKey(itemName)) return;

    if (currentItems[itemName]!.quantity > 1) {
      currentItems[itemName]!.quantity--;
    } else {
      currentItems.remove(itemName);
    }

    emit(state.copyWith(items: currentItems));
  }
}
