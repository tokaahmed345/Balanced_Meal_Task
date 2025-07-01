import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_confirm_order_body.dart';
import 'package:flutter/material.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({super.key, required this.selectedItems});
final   Map<String, SelectedItem> selectedItems;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: CustomConfirmOrder(selectedItems:selectedItems ),);
  
  
  }



}