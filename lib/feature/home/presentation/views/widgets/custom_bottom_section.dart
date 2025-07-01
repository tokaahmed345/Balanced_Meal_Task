
// import 'package:balancedmeal/core/utils/colors/app_color.dart';
// import 'package:balancedmeal/core/utils/router/router.dart';
// import 'package:balancedmeal/core/utils/styles/style.dart';
// import 'package:balancedmeal/core/widget/custom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class CustomBottomBodySection extends StatelessWidget {
//   const CustomBottomBodySection({
//     super.key, required this.title,
//   });
// final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [ Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//         child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Text("calc",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
//                  Text("325426546784",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
//            ],
//          ),
//       ),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
//            children: [
//              Text("price",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
//                 Text("12\$",style: AppStyle.text16.copyWith(color: AppColor.red)),
//            ],
//                        ),
//         ),
          
//        CustomButton(text: title, onPressed:()
//{GoRouter.of(context).push(AppRouters.confirmOrder);} ),
//      const SizedBox(height: 20,)],);
//   }
// }

import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:balancedmeal/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CustomBottomBodySection extends StatelessWidget {
  const CustomBottomBodySection({
    super.key, required this.title,  this.totalCalories,  this.totalPrice,  this.requiredCalories,  this.isButtonEnabled,  this.onPressed,
  });
final String title;
  final num ?totalCalories;
  final num? totalPrice;
  final num ?requiredCalories;
  final bool ?isButtonEnabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("calc",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
                 Text("$totalCalories / 2500",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
           ],
         ),
      ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
           children: [
             Text("price",style: AppStyle.text16.copyWith(color: AppColor.blackColor),),
                Text("\$${totalPrice?.toStringAsFixed(2)}",style: AppStyle.text16.copyWith(color: AppColor.red)),
           ],
                       ),
        ),
          
 CustomButton(
  text: title,
  onPressed: (isButtonEnabled ?? false) ? onPressed : null,
),
     const SizedBox(height: 20,)],);
  }
}