// import 'package:balancedmeal/core/utils/colors/app_color.dart';
// import 'package:balancedmeal/core/utils/styles/style.dart';
// import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
// import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/add_meal.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomCard extends StatelessWidget {
//   const CustomCard({super.key, required this.meal});
// final MealDataModel meal;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 6.0),
//       child: Container(
//           width: MediaQuery.of(context).size.height * .2,
//           height: MediaQuery.of(context).size.height * .3
// ,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Card(
//             elevation: 5,
//             child: Column(
//               children: [
                
// SizedBox(
//   width: double.infinity,
//   child: Image(image: NetworkImage(meal.image,),height: MediaQuery.of(context).size.height*.1,fit:BoxFit.cover)),
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [Text(meal.itemName), Text('${meal.calories.toString()} Cal')],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('${meal.price.toString()}\$',
//                           style: AppStyle.text14.copyWith(
//                             color: AppColor.blackColor,
//                           )),
//                       const SizedBox(height: 5),
//                       ElevatedButton(
//                         onPressed: () {  
//                             context.read<OrderCubit>().addMeal(meal);
// },
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           backgroundColor: AppColor.orangeColor,
//                           minimumSize: const Size(60, 40),
//                         ),
//                         child: Text(
//                           'Add',
//                           style: AppStyle.text16.copyWith(color: Colors.white),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selecte_item_cubit.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCard extends StatelessWidget {
  final MealDataModel meal;
  const CustomCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        width: MediaQuery.of(context).size.height * .2,
        height: MediaQuery.of(context).size.height * .3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  meal.image,
                  height: MediaQuery.of(context).size.height * .1,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(meal.itemName),
                  Text('${meal.calories} Cal'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${meal.price}\$',
                        style: AppStyle.text14.copyWith(
                          color: AppColor.blackColor,
                        )),
                    const SizedBox(height: 5),
                
                    BlocBuilder<SelectedItemCubit, OrderState>(
                      builder: (context, state) {
                        final selected = state.items[meal.itemName];
                
                        if (selected != null) {
                          return Row(
                            children: [
                            CustomIconButton(icon: const Icon(FontAwesomeIcons.minus,color:  AppColor.whiteColor,), onPressed: (){     
                                  context.read<SelectedItemCubit>().removeMeal(meal.itemName);
                }),
                              Text('${selected.quantity}'),
                             CustomIconButton(icon:const  Icon(Icons.add,color: AppColor.whiteColor,), onPressed: (){
                                  context.read<SelectedItemCubit>().addMeal(meal);
                
                             })
                            ],
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              context.read<SelectedItemCubit>().addMeal(meal);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.orangeColor,
                              minimumSize: const Size(60, 40),
                            ),
                            child: Text(
                              'Add',
                              style: AppStyle.text16.copyWith(color: AppColor.whiteColor),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
