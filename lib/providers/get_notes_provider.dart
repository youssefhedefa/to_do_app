import 'package:flutter/foundation.dart';
import 'package:to_do_app/model/note_model.dart';
import 'package:to_do_app/repo/note_repo.dart';

class GetNotesProvider extends ChangeNotifier {
  final NoteRepo repo;

  GetNotesProvider({required this.repo});

  List<NoteModel> notes = [];
  String error = '';
  bool loading = false;

  Future getNotes() async {
    print('getNotes method called'); // Add this line
    loading = true;
    notifyListeners();
    var result = await repo.getNotes();
    result.fold(
      (error) {
        this.error = error;
        loading = false;
        notifyListeners();
      },
      (notes) {
        loading = false;
        this.notes = notes;
        notifyListeners();
      },
    );
  }
}
