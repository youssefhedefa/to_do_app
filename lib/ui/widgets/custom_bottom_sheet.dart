import 'package:flutter/material.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/ui/widgets/custom_button.dart';
import 'package:to_do_app/ui/widgets/custom_text_field.dart';
import 'package:to_do_app/ui/widgets/date.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: const BoxDecoration(
        color: AppColorHelper.blackColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomTextField(
            hintText: 'title',
            isMultiline: false,
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            hintText: 'Enter your note',
            isMultiline: true,
          ),
          const SizedBox(height: 16),
          const CustomDatePicker(),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: CustomButton(
              text: 'Save',
              color: AppColorHelper.greenColor,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
