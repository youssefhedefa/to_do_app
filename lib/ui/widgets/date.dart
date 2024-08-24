import 'package:flutter/material.dart';
import 'package:to_do_app/utils/helper/color_helper.dart';
import 'package:to_do_app/utils/helper/text_style_helper.dart';
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
              firstDate: DateTime.now(),
              lastDate: DateTime(2026),
            ).then(
              (value) {
                DateTime dateTime = DateTime.parse(value.toString());
                String formattedDate =
                    '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';

              },
            );
          },
        ),
        const Spacer(),
        Text(
          '',
          style: AppTextStyleHelper.font18GreyRegular,
        ),
      ],
    );
  }
}
