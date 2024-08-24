import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/note_repo.dart';
import 'package:to_do_app/logic/get_notes_cubit/get_notes_states.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  final NoteRepo repo;

  GetNotesCubit({required this.repo}) : super(GetNotesInitial());

  void getNotes() async {
    print('object');
    emit(GetNotesLoading());
    final result = await repo.getNotes();
    result.fold(
      (error) => emit(GetNotesFailure(message: error)),
      (notes) {
        notes.sort((a, b) => b.date.compareTo(a.date));
        emit(GetNotesSuccess(notes: notes));
      },
    );
  }
}