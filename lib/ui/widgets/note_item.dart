import 'package:flutter/material.dart';
import 'package:to_do_app/data/model/note_model.dart';
import 'package:to_do_app/utils/helper/color_helper.dart';
import 'package:to_do_app/utils/helper/text_style_helper.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        note.delete().then((value) {
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
                  note.title,
                  style: AppTextStyleHelper.font28WhiteBold,
                ),
                Text(note.date, style: AppTextStyleHelper.font18GreyRegular),
                const SizedBox(height: 8),
                Text(
                  note.note,
                  style: AppTextStyleHelper.font18GreyRegular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
