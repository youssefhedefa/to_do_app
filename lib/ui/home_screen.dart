import 'package:flutter/material.dart';
import 'package:to_do_app/helper/color_helper.dart';
import 'package:to_do_app/helper/text_style_helper.dart';
import 'package:to_do_app/ui/widgets/custom_bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/note_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Notes',
          style: AppTextStyleHelper.font32WhiteBold,
        ),
        backgroundColor: AppColorHelper.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFAB(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 12,
        ),
        itemCount: 5,
      ),
    );
  }

  Widget buildFAB() {
    return Builder(builder: (context) {
      return FloatingActionButton(
        onPressed: () {
          showBottomSheet(
            context: context,
            builder: (context) {
              return const CustomBottomSheet();
            },
          );
        },
        backgroundColor: AppColorHelper.greenColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
    });
  }
}
