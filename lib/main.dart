import 'package:balancedmeal/core/utils/app_pages/app_pages.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/meal_data-cubit/meal_data_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/home/data/repos/meal_repo_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealDataCubit(mealRepo: MealRepoImpl(firestore:FirebaseFirestore.instance))..fetchData('vegetable'),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppPages.goRouter,
      ),
    );
  }
}
