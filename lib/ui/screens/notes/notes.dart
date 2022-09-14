import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login/ui/screens/notes/notes_cubit.dart';

import '../../../utils/constants.dart';
import '../add_note/add_note.dart';

class Notes extends StatelessWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey[100],
          elevation: 2,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new AddNote()));
          }),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title: const Text('Notes',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: BlocConsumer<NotesCubit, NotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          NotesCubit notesCubit = NotesCubit.get(context)..getNotes();
          return (state is NotesLoading)
              ? Center(
                  child: LoadingAnimationWidget.prograssiveDots(
                    color: appColor,
                    size: MediaQuery.of(context).size.width / 10,
                  ),
                )
              : (notesCubit.notes.isEmpty)
                  ? Center(
                      child: Text(
                        'There\'s No Data To Show',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: notesCubit.notes.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 80,
                          child: ListTile(
                            leading: const Icon(
                              Icons.note,
                              color: appColor,
                            ),
                            title: Text(notesCubit.notes[index].title!),
                            subtitle:
                                Text(notesCubit.notes[index].description!),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
