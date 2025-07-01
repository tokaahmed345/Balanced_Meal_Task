// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFFF25700),
//         minimumSize: const Size(double.infinity, 60),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//       child: Text(
//         text,
//         style: GoogleFonts.poppins(
//           color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = onPressed != null;

    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? AppColor.orangeColor: AppColor.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: AppStyle.text16.copyWith(color: AppColor.whiteColor),
        ),
      ),
    );
  }
}
