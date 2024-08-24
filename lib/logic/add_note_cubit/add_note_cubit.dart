import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/model/note_model.dart';
import 'package:to_do_app/data/repo/note_repo.dart';
import 'package:to_do_app/logic/add_note_cubit/add_note_states.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  final NoteRepo repo;

  AddNoteCubit({required this.repo}) : super(AddNoteInitial());


  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String dateController = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future addNote({
    required String title,
    required String note,
    required String date,
  }) async {
    emit(AddNoteLoading());
    final result = await repo.addNote(
      note: NoteModel(
        id: DateTime.now().microsecondsSinceEpoch,
        title: title,
        date: date,
        note: note,
      ),
    );
    result.fold(
      (error) => emit(AddNoteFailure(message: error)),
      (_) => emit(AddNoteSuccess()),
    );
  }

  void resetControllers() {
    titleController.clear();
    noteController.clear();
    dateController = '';
  }

  void changeDate({required String date}) {
    dateController = date;
    emit(ChangeDate(date: date));
  }
}
