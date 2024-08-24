import 'package:flutter/material.dart';
import 'package:to_do_app/model/note_model.dart';
import 'package:to_do_app/repo/note_repo.dart';

class AddNoteProvider extends ChangeNotifier {
  final NoteRepo repo;

  AddNoteProvider({required this.repo});

  TextEditingController titleController = TextEditingController();
  String dateController = '';
  TextEditingController noteController = TextEditingController();
  bool loading = false;
  bool getNotes = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  addNote({required String title,required String note,required String date,}) async {
    var result = await repo.addNote(note: NoteModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: title,
        date: date,
        note: note,
    ),);
    loading = true;
    ChangeNotifier();
    result.fold((error) {
      print(error);
      loading = false;
      ChangeNotifier();
      return error;
    }, (success) {
      print('Note added successfully');
      loading = false;
      getNotes = true;
      ChangeNotifier();
      return 'Note added successfully';
    });
  }

  setDateController(String date) {
    dateController = date;
    notifyListeners();
  }

  resetControllers() {
    titleController.clear();
    noteController.clear();
    loading = false;
    dateController = '';
    notifyListeners();
  }

}
