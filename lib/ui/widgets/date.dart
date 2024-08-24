import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/helper/text_style_helper.dart';
import 'package:to_do_app/providers/add_note_provider.dart';
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
                context
                    .read<AddNoteProvider>()
                    .setDateController(formattedDate);
              },
            );
          },
        ),
        const Spacer(),
        Text(
          context.watch<AddNoteProvider>().dateController,
          style: AppTextStyleHelper.font18GreyRegular,
        ),
      ],
    );
  }
}
