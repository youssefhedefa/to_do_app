import 'package:to_do_app/data/model/note_model.dart';

abstract class GetNotesState{}

class GetNotesInitial extends GetNotesState{}

class GetNotesLoading extends GetNotesState{}

class GetNotesSuccess extends GetNotesState{
  final List<NoteModel> notes;
  GetNotesSuccess({required this.notes});
}

class GetNotesFailure extends GetNotesState{
  final String message;
  GetNotesFailure({required this.message});
}