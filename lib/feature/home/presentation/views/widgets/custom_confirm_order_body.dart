import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:balancedmeal/core/widget/custom_appbar.dart';
import 'package:balancedmeal/feature/home/data/models/order_item_model.dart';
import 'package:balancedmeal/feature/home/data/services/order_service.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_bottom_section.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

// class CustomConfirmOrder extends StatefulWidget {
//   const CustomConfirmOrder({super.key});

//   @override
//   State<CustomConfirmOrder> createState() => _CustomConfirmOrderState();
// }

// class _CustomConfirmOrderState extends State<CustomConfirmOrder> {
//         int count =1;

//   @override
//   Widget build(BuildContext context) {

//     return Padding(

//       padding: const EdgeInsets.symmetric( horizontal: 20),
//       child: Column(
//         children: [
//           const CustomAppBar(title: 'Order Summary'),
//           Card(
//             elevation: 5,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset(
//                   "assets/images/carrot.png",
//                   width: MediaQuery.of(context).size.height * .1,
//                 ),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "Carrot",
//                         style: AppStyle.text16
//                             .copyWith(color: AppColor.blackColor),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "12 Cal",
//                         style: AppStyle.text14,
//                       ),
//                     ),
//                   ],
//                 ),
                
             
//                  Expanded(
//                     child: SizedBox(
//                       child: Column(children: [
//                         Text("12\$",
//                             style: AppStyle.text16
//                                 .copyWith(color: AppColor.blackColor)),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             CustomIconButton(
//                               icon: const Icon(
//                                 FontAwesomeIcons.minus,
//                                 color: AppColor.whiteColor,
//                               ),
//                               onPressed: () {
//                                 count--;
//                               setState(() {
                                
//                               });
//                               },
//                             ),
//                             Text(count.toString(),
//                                 style: AppStyle.text16
//                                     .copyWith(color: AppColor.blackColor)),
//                             CustomIconButton(
//                                 icon: const Icon(
//                                   Icons.add,
//                                   color: AppColor.whiteColor,
//                                 ),
//                                 onPressed: () {count++;  
//                                 setState(() {
                                
//                               });                        print(count);
//                                               }),
//                           ],
//                         )
//                       ]),
//                     ),
//                   ),
                
//               ],
//             ),
//           ),
//           const Spacer(),
//           const CustomBottomBodySection(
//             title: 'Confirm ',
//           )
//         ],
//       ),
//     );
//   }


class CustomConfirmOrder extends StatefulWidget {
  final Map<String, SelectedItem> selectedItems;

  const CustomConfirmOrder({super.key, required this.selectedItems});

  @override
  State<CustomConfirmOrder> createState() => _CustomConfirmOrderState();
}

class _CustomConfirmOrderState extends State<CustomConfirmOrder> {
  late Map<String, int> quantities;
  final int requiredCalories = 2500;
  final OrderService _orderService = OrderService();

  @override
  void initState() {
    super.initState();
    quantities = {
      for (var entry in widget.selectedItems.entries) entry.key: entry.value.quantity,
    };
  }

  bool canPlaceOrder(num totalCalories) {
    return totalCalories >= requiredCalories;
  }

  @override
  Widget build(BuildContext context) {
    num totalPrice = 0;
    num totalCalories = 0;

    widget.selectedItems.forEach((key, selectedItem) {
      final qty = quantities[key] ?? 1;
      totalPrice += selectedItem.meal.price * qty;
      totalCalories += selectedItem.meal.calories * qty;
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const CustomAppBar(title: 'Order Summary'),
          ...widget.selectedItems.entries.map((entry) {
            final meal = entry.value.meal;
            final quantity = quantities[entry.key] ?? 1;

            return Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    meal.image,
                    width: MediaQuery.of(context).size.height * .1,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          meal.itemName,
                          style: AppStyle.text16.copyWith(color: AppColor.blackColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${meal.calories} Cal",
                          style: AppStyle.text14,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "\$${meal.price}",
                          style: AppStyle.text16.copyWith(color: AppColor.blackColor),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomIconButton(
                              icon: const Icon(FontAwesomeIcons.minus, color: AppColor.whiteColor),
                              onPressed: () {
                                setState(() {
                                  if (quantities[entry.key]! > 1) {
                                    quantities[entry.key] = quantities[entry.key]! - 1;
                                  }
                                });
                              },
                            ),
                            Text(quantity.toString(),
                                style: AppStyle.text16.copyWith(color: AppColor.blackColor)),
                            CustomIconButton(
                              icon: const Icon(Icons.add, color: AppColor.whiteColor),
                              onPressed: () {
                                setState(() {
                                  quantities[entry.key] = quantities[entry.key]! + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
          const Spacer(),
          CustomBottomBodySection(
            title: 'Confirm',
            totalPrice: totalPrice,
            totalCalories: totalCalories,
            isButtonEnabled: canPlaceOrder(totalCalories),
            onPressed: canPlaceOrder(totalCalories)
                ? () async {
                    final orderItems = widget.selectedItems.entries.map((entry) {
                      final meal = entry.value.meal;
                      final quantity = quantities[entry.key] ?? 1;
                      return OrderItem(
                        name: meal.itemName,
                        totalPrice: meal.price * quantity,
                        quantity: quantity,
                      );
                    }).toList();

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => const Center(child: CircularProgressIndicator()),
                    );

                    try {
                      final success = await _orderService.placeOrder(orderItems);
                      Navigator.of(context).pop(); 
if (success) {
  print("Order success");

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Success'),
      content: const Text('Order placed successfully!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            GoRouter.of(context).pop(); 
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
} else {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Failed to place order. Please try again.')),
  );
}


                      
                    } catch (e) {
                      Navigator.of(context).pop(); 
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error occurred: $e')),
                      );
                    }
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
