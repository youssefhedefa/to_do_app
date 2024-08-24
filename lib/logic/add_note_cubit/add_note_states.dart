abstract class AddNoteState{}

class AddNoteInitial extends AddNoteState{}

class AddNoteLoading extends AddNoteState{}

class AddNoteSuccess extends AddNoteState{}

class ChangeDate extends AddNoteState{
  final String date;
  ChangeDate({required this.date});
}

class AddNoteFailure extends AddNoteState{
  final String message;
  AddNoteFailure({required this.message});
}