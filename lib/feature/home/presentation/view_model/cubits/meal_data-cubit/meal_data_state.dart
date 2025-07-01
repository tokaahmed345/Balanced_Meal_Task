part of 'meal_data_cubit.dart';

@immutable
sealed class MealDataState {}

final class MealDataInitial extends MealDataState {}
final class MealDataLoading extends MealDataState {}
final class MealDataSuccess extends MealDataState {
  final List <MealDataModel>meals;

  MealDataSuccess(this.meals);
}
final class MealDataFailure extends MealDataState {final String message;

  MealDataFailure({required this.message});}
