
import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final Icon icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 37,
          decoration: const BoxDecoration(
              color: AppColor.orangeColor, shape: BoxShape.circle),
          child: IconButton(onPressed: onPressed, icon: icon)),
    );
  }
}
