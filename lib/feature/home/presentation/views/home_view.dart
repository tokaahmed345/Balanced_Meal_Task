import 'package:balancedmeal/core/widget/custom_appbar.dart';
import 'package:balancedmeal/feature/home/presentation/view_model/cubits/add_meal_cubit/selecte_item_cubit.dart';
import 'package:balancedmeal/feature/home/presentation/views/widgets/home_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedItemCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(title: 'Create your order'),
        body: HomeBodyView(),
      ),
    );
  }
}
