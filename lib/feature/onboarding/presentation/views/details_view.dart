import 'package:balancedmeal/core/widget/custom_appbar.dart';
import 'package:balancedmeal/feature/onboarding/presentation/views/widgets/detail_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(appBar: CustomAppBar(title: 'Enter your details'),body: DetailViewBody(),);
  }
}