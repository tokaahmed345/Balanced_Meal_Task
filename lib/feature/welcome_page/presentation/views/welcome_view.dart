import 'package:balancedmeal/feature/welcome_page/presentation/views/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';


class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: WelcomeViewBody(),
    );
  }
}