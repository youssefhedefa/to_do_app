import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/logic/add_note_cubit/add_note_cubit.dart';
import 'package:to_do_app/logic/add_note_cubit/add_note_states.dart';
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
                context.read<AddNoteCubit>().changeDate(
                  date: formattedDate,
                );
              },
            );
          },
        ),
        const Spacer(),
        BlocBuilder<AddNoteCubit,AddNoteState>(
          builder: (context,state) {
            if(state is ChangeDate) {
              return Text(
                state.date,
                style: AppTextStyleHelper.font18GreyRegular,
              );
            }
            return Text(
              'No date selected',
              style: AppTextStyleHelper.font18GreyRegular,
            );
          }
        ),
      ],
    );
  }
}
