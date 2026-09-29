import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:level4/database/data.dart';
import 'package:level4/database/logic.dart';
import 'package:level4/database/note_screen.dart';

class NoteUi extends StatefulWidget {
  const new({super.key});

  @override
  State<NoteUi> createState() => _NoteUiState();
}

class _NoteUiState extends State<NoteUi> {
  late Future<List<Notes>> notesFuture;
  void getNotes() async {
    notesFuture = DatabaseHelper.readNotes();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note App"), centerTitle: true),
      body: FutureBuilder<List<Notes>?>(
        future: notesFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text("Error Loading notes"));
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text("Add new note to get started"));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Notes note = snapshot.data[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteScreen(notes: note),
                    ),
                  ).then((value) {
                    getNotes();
                  });
                },
                tileColor: Colors.lightGreen.shade800,
                title: Text(note.title),
                subtitle: Text(note.content),
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Do you want to delete this note"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              DatabaseHelper.deleteNote(note.id!).then((value) {
                                getNotes();
                              });

                              Navigator.pop(context);
                            },
                            child: Text("Delete"),
                          ),
                        ],
                      );
                    },
                  );
                },
                // trailing: IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.delete),
                // ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteScreen()),
          ).then((value) {
            getNotes();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
