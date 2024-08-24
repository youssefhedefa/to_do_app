import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/model/note_model.dart';
import 'package:to_do_app/utils/constances/box_constance.dart';

class NoteRepo {

  Future<Either<String, bool>> addNote({required NoteModel note}) async {
    try {
      var notesBox = Hive.box<NoteModel>(AppBoxsConstance.noteBox);
      await notesBox.add(note);
      return const Right(true);
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, List<NoteModel>>> getNotes() async {
    try {
      var notesBox = Hive.box<NoteModel>(AppBoxsConstance.noteBox);
      List<NoteModel> notes = notesBox.values.toList();
      return Right(notes);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
