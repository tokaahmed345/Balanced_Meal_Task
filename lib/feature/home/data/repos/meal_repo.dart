import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';

abstract class MealRepo {
Future<List<MealDataModel>>getData(String category);

}