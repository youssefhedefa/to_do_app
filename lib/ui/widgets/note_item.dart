import 'package:flutter/material.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/helper/text_style_helper.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        print('Dismissed');
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
                const Text(
                  'title',
                  style: AppTextStyleHelper.font28WhiteBold,
                ),
                Text('date', style: AppTextStyleHelper.font18GreyRegular),
                const SizedBox(height: 8),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book ',
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
