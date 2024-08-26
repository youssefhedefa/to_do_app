import 'package:flutter/material.dart';
import 'package:to_do_app/data/model/note_model.dart';
import 'package:to_do_app/ui/widgets/custom_text_field.dart';
import 'package:to_do_app/utils/helper/color_helper.dart';
import 'package:to_do_app/utils/helper/text_style_helper.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late TextEditingController titleController;
  late TextEditingController noteController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.note.title);
    noteController = TextEditingController(text: widget.note.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buildEditDialog();
      },
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          widget.note.delete().then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Note deleted'),
              ),
            );
          });
        },
        direction: DismissDirection.startToEnd,
        background: Container(
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColorHelper.darkPrimaryColor,
            border: const Border(
              left: BorderSide(
                color: AppColorHelper.skinColor,
                width: 4,
              ),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SizedBox(
            height: 130,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note.title,
                    style: AppTextStyleHelper.font28WhiteBold,
                  ),
                  Text(widget.note.date,
                      style: AppTextStyleHelper.font18GreyRegular),
                  const SizedBox(height: 8),
                  Text(
                    widget.note.note,
                    style: AppTextStyleHelper.font18GreyRegular,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildEditDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: AlertDialog(
            backgroundColor: AppColorHelper.blackColor,
            title: const Text(
              'Edit Note',
              style: AppTextStyleHelper.font28WhiteBold,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hintText: titleController.text,
                  isMultiline: false,
                  controller: titleController,
                  validatorText: '',
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: noteController.text,
                  isMultiline: false,
                  controller: noteController,
                  validatorText: '',
                ),

              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: AppTextStyleHelper.font18WhiteRegular,
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.note.title = titleController.text;
                  widget.note.note = noteController.text;
                  widget.note.save().then((value) {
                    setState(() {});
                    Navigator.pop(context,true);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Note updated'),
                      ),
                    );
                  });
                },
                child: Text(
                  'Save',
                  style: AppTextStyleHelper.font18WhiteRegular,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
