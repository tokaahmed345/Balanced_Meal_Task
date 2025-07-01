import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
import 'package:balancedmeal/feature/home/data/repos/meal_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MealRepoImpl extends MealRepo {
    final FirebaseFirestore firestore;

  MealRepoImpl({required this.firestore});

  @override
  Future<List<MealDataModel>> getData(String category)async {
 final snapshot = await firestore.collection(category).get();
    return snapshot.docs.map((e)=>MealDataModel.fromJson(e.data())).toList();


  }

}