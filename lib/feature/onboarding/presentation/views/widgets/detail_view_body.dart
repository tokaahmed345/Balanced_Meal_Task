import 'package:balancedmeal/core/utils/functions/functions.dart';
import 'package:balancedmeal/core/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:balancedmeal/core/widget/custom_button.dart';
import 'package:balancedmeal/feature/onboarding/presentation/views/widgets/custom_drop_down.dart';
import 'package:balancedmeal/feature/onboarding/presentation/views/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class DetailViewBody extends StatefulWidget {
  const DetailViewBody({super.key});

  @override
  State<DetailViewBody> createState() => _DetailViewBodyState();
}

class _DetailViewBodyState extends State<DetailViewBody> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String? selectedGender;

  bool isFormValid = false;

  @override
  void initState() {
    super.initState();
    weightController.addListener(validateForm);
    heightController.addListener(validateForm);
    ageController.addListener(validateForm);
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  void validateForm() {
    final isValid = weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        selectedGender != null;

    if (isValid != isFormValid) {
      setState(() {
        isFormValid = isValid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: Column(
        children: [
          CustomDropdown(
            label: "Gender",
            items: const ["Male", "Female"],
            selectedItem: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
              validateForm();
            },
          ),
          CustomTextField(
            label: "Weight",
            hint: "Enter your weight (Kg)",
            controller: weightController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            label: "Height",
            hint: "Enter your height (Cm)",
            controller: heightController,
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            label: "Age",
            hint: "Enter your age",
            controller: ageController,
            keyboardType: TextInputType.number,
          ),
          const Spacer(),
          CustomButton(
            text: "Next",
            onPressed: isFormValid
                ? () {
    dynamic calories = getCalculatedCalories();
        print('Calories: $calories');
GoRouter.of(context).push(AppRouters.homePage);
                }
                : null,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  double getCalculatedCalories() {

    final weight = double.tryParse(weightController.text) ?? 0;
        final height = double.tryParse(heightController.text) ?? 0;
        final age = int.tryParse(ageController.text) ?? 0;
    
        final  calories = calculateCalorie(
          gender: selectedGender!,
          weight: weight,
          height: height,
          age: age,
        );
    return calories;
  }
}
