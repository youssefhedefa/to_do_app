import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/providers/add_note_provider.dart';
import 'package:to_do_app/providers/get_notes_provider.dart';
import 'package:to_do_app/ui/widgets/custom_button.dart';
import 'package:to_do_app/ui/widgets/custom_text_field.dart';
import 'package:to_do_app/ui/widgets/date.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddNoteProvider>(
      builder: (context, provider, child) {
        if (provider.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (provider.getNotes) {
          context.read<GetNotesProvider>().getNotes();
        }
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
              key: context.read<AddNoteProvider>().formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    hintText: 'title',
                    isMultiline: false,
                    validatorText: 'title',
                    controller: context.read<AddNoteProvider>().titleController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Enter your note',
                    validatorText: ' ',
                    isMultiline: true,
                    controller: context.read<AddNoteProvider>().noteController,
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
      },
    );
  }

  onSave({required BuildContext context}) {
    if (!context.read<AddNoteProvider>().formKey.currentState!.validate()) {
      return;
    }
    context.read<AddNoteProvider>().addNote(
          title: context.read<AddNoteProvider>().titleController.text,
          note: context.read<AddNoteProvider>().noteController.text,
          date: context.read<AddNoteProvider>().dateController,
        );
    context.read<AddNoteProvider>().resetControllers();
    context.read<GetNotesProvider>().getNotes();
  }
}
