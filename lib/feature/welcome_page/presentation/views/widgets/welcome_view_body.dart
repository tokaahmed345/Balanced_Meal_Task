

import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/router/router.dart';
import 'package:balancedmeal/core/widget/custom_button.dart';
import 'package:balancedmeal/feature/welcome_page/presentation/views/widgets/black_overlay.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
    
        const BlurOverlay(),
    
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              'Balanced Meal',
              style: GoogleFonts.abhayaLibre(
                fontSize: 48,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
    
        Positioned(
          bottom: 160,
          left: 24,
          right: 24,
          child: Text(
            'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: AppColor.grayColor,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
    
        Positioned(
          bottom: 30,
          left: 24,
          right: 24,
          child: CustomButton(
            text: 'Order Food',
            onPressed: () {
GoRouter.of(context).push(AppRouters.detailsScreen);
            },
          ),
        )
      ],
    );
  }
}
