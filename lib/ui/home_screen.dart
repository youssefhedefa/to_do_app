import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/note_repo.dart';
import 'package:to_do_app/logic/get_notes_cubit/get_notes_cubit.dart';
import 'package:to_do_app/logic/get_notes_cubit/get_notes_states.dart';
import 'package:to_do_app/ui/widgets/custom_bottom_sheet.dart';
import 'package:to_do_app/ui/widgets/note_item.dart';
import 'package:to_do_app/utils/helper/color_helper.dart';
import 'package:to_do_app/utils/helper/text_style_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNotesCubit(repo: NoteRepo())..getNotes(),
      child: Scaffold(
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
        body: BlocBuilder<GetNotesCubit,GetNotesState>(
          builder: (context,state) {
            if (state is GetNotesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is GetNotesFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTextStyleHelper.font28WhiteBold,
                ),
              );
            }
            if (state is GetNotesSuccess) {
             return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => NoteItem(
                  note: state.notes[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
                itemCount: state.notes.length,
              );
            }
            return const SizedBox();
          }
        ),
      ),
    );
  }

  Widget buildFAB() {
    return Builder(
      builder: (newContext) {
        return FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              context: newContext,
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
      },
    );
  }
}
