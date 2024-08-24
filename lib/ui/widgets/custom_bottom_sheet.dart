import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/logic/add_note_cubit/add_note_cubit.dart';
import 'package:to_do_app/logic/get_notes_cubit/get_notes_cubit.dart';
import 'package:to_do_app/utils/helper/color_helper.dart';
import 'package:to_do_app/ui/widgets/custom_button.dart';
import 'package:to_do_app/ui/widgets/custom_text_field.dart';
import 'package:to_do_app/ui/widgets/date.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        decoration: const BoxDecoration(
          color: AppColorHelper.blackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Form(
          key: context.read<AddNoteCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hintText: 'title',
                isMultiline: false,
                validatorText: 'title',
                controller: context.read<AddNoteCubit>().titleController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Enter your note',
                validatorText: ' ',
                isMultiline: true,
                controller: context.read<AddNoteCubit>().noteController,
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
                    onSave(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSave({required BuildContext context}) {
    if (!context.read<AddNoteCubit>().formKey.currentState!.validate()) {
      return;
    }
    context
        .read<AddNoteCubit>()
        .addNote(
          title: context.read<AddNoteCubit>().titleController.text,
          note: context.read<AddNoteCubit>().noteController.text,
          date: context.read<AddNoteCubit>().dateController,
        )
        .then((value) {
      context.read<GetNotesCubit>().getNotes();
      context.read<AddNoteCubit>().resetControllers();
      Navigator.pop(context);
    });

  }
}
