//where we are going to add and edit notes
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:level4/database/data.dart';
import 'package:level4/database/logic.dart';

class NoteScreen extends StatefulWidget {
  final Notes? notes;
  const new({this.notes, super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (widget.notes != null) {
      titleController.text = widget.notes!.title;
      contentController.text = widget.notes!.content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.notes == null ? "Add Note" : "Update Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hint: Text("title")),
            ),
            TextField(
              controller: contentController,
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              decoration: InputDecoration(
                hint: Text("Content"),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (titleController.text.isEmpty &&
                      contentController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Fill in the fields")),
                    );
                  } else {
                    Notes note = Notes(
                      id: widget.notes?.id,
                      title: titleController.value.text,
                      content: contentController.value.text,
                      date: DateTime.now(),
                    );

                    if (widget.notes != null) {
                      await DatabaseHelper.updateNote(note);
                    } else {
                      await DatabaseHelper.insertNote(note);
                    }
                  }

                  Navigator.pop(context);
                },
                child: Text(widget.notes == null ? "Add Note" : "Update Note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
