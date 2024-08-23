import 'package:flutter/material.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/helper/text_style_helper.dart';
import 'package:to_do_app/ui/widgets/custom_button.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          text: 'Pick a date',
          color: AppColorHelper.greyColor,
          onPressed: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2021),
              lastDate: DateTime(2025),
            ).then((value) => print(value));
          },
        ),
        const Spacer(),
        Text(
          'Date: 2024-09-01',
          style: AppTextStyleHelper.font18GreyRegular,
        ),
      ],
    );
  }
}
