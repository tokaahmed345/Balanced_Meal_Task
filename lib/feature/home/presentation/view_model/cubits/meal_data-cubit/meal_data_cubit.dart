import 'package:balancedmeal/feature/home/data/models/meal_data_model.dart';
import 'package:balancedmeal/feature/home/presentation/repos/meal_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meal_data_state.dart';

class MealDataCubit extends Cubit<MealDataState> {
  MealDataCubit( {required this.mealRepo}) : super(MealDataInitial());
final MealRepo mealRepo;

Future<void>fetchData(String category)async{
  emit(MealDataLoading());
  try{
  final data= await  mealRepo.getData(category);
  emit(MealDataSuccess(data));
  }catch(e){
emit(MealDataFailure(message: e.toString()));
  }

}
  
}
