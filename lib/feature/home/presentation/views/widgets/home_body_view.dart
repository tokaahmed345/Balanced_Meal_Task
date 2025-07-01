// import 'package:balancedmeal/feature/home/presentation/view_model/cubits/meal_data-cubit/meal_data_cubit.dart';
// import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_body_section.dart';
// import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_bottom_section.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeBodyView extends StatelessWidget {
//   const HomeBodyView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MealDataCubit, MealDataState>(
//       builder: (context, state) {
//         if (state is MealDataSuccess) {
          
//          final  allMeals=state.meals;
//           final vegetables = allMeals.where((meal) => meal.type == 'vegetables').toList();
//   final carbs = allMeals.where((meal) => meal.type == 'carb').toList();
//   final meats = allMeals.where((meal) => meal.type == 'meat').toList();
//   return  Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//     child: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomBodySection(title: 'Vegetabels',meals: vegetables,),
//           CustomBodySection(meals: meats,title: 'Meat',),
//           CustomBodySection(meals: carbs,title: 'Carbs'),
//          const  CustomBottomBodySection(
//           title: 'Place order',
//           )
//         ],
//       ),
//     ),
//   );
// }else if(state is MealDataFailure){
//   return Text(state.message);

// }else{
//   return Center(child: CircularProgressIndicator(),);
// }
//       },
//     );
//   }
// }

import 'package:balancedmeal/core/utils/router/router.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selecte_item_cubit.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selected_item_state.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/meal_data-cubit/meal_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_body_section.dart';
import 'custom_bottom_section.dart';

class HomeBodyView extends StatelessWidget {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDataCubit, MealDataState>(
      builder: (context, mealState) {
        if (mealState is MealDataSuccess) {
          final allMeals = mealState.meals;
          final vegetables = allMeals.where((meal) => meal.type == 'vegetables').toList();
          final carbs = allMeals.where((meal) => meal.type == 'carb').toList();
          final meats = allMeals.where((meal) => meal.type == 'meat').toList();

          return BlocBuilder<SelectedItemCubit, OrderState>(
            builder: (context, orderState) {
              int requiredCalories = 2500;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBodySection(title: 'Vegetables', meals: vegetables),
                      CustomBodySection(title: 'Meat', meals: meats),
                      CustomBodySection(title: 'Carbs', meals: carbs),

                      CustomBottomBodySection(
                        title: 'Place order',
                        totalCalories: orderState.totalCalories,
                        totalPrice: orderState.totalPrice,
                        requiredCalories: requiredCalories,
                        isButtonEnabled: orderState.canPlaceOrder(requiredCalories),
                        onPressed: () {
                            final selectedItems = context.read<SelectedItemCubit>().state.items;

GoRouter.of(context).push(AppRouters.confirmOrder,extra: selectedItems);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (mealState is MealDataFailure) {
          return Center(child: Text(mealState.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
