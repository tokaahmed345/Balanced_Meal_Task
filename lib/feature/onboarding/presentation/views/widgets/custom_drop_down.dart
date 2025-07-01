import 'package:balancedmeal/core/utils/colors/app_color.dart';
import 'package:balancedmeal/core/utils/styles/style.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? selectedItem;
  final void Function(String?) onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyle.text14.copyWith(color: AppColor.blackColor)),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: selectedItem,
          hint:  Text("Choose your gender",style:AppStyle.text16 ),
          onChanged: onChanged,
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          decoration: InputDecoration(
          border:  OutlineInputBorder(borderSide: const BorderSide(color: AppColor.grey),borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColor.grey),borderRadius: BorderRadius.circular(16)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
