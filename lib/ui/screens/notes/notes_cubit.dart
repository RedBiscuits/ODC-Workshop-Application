import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data/database/database.dart';
import 'package:meta/meta.dart';

import '../../../data/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<Note> notes = [];

  static NotesCubit get(context) => BlocProvider.of(context);

  Future getNotes() async {
    emit(NotesLoading());
    NotesDatabaseHelper.initDb();
    NotesDatabaseHelper.getNotes().then((value) {
      notes = [];
      for (Map<String, dynamic> cat in value) {
        notes.add(Note(
            id: cat['id'],
            title: cat['title'],
            description: cat['description'],
            date: cat['date']));
      }
      emit(NotesLoaded());
    });
  }
}
