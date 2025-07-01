
import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CustomBodySection extends StatelessWidget {
  const CustomBodySection({
    super.key, required this.meals, required this.title,  
  });
  final List< MealDataModel> meals;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

      children: [ 
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8),
      child: Text(title,style: AppStyle.text16.copyWith(fontSize: 20,color: AppColor.blackColor),),
    ),
    SizedBox(
      height: MediaQuery.of(context).size.height*.25,
      width: MediaQuery.of(context).size.height*.5,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
             itemBuilder: (context,index){
      return  CustomCard(meal: meals[index],);
             },
      ),
    ),
              
              
              ],);
  }
}
