//! This is file is meant for the first screen, i.e., ListScreen.
//! Parts of the code have been given. Complete the remaining.
//? You can refactor the code if needed

import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';
import 'package:midterm/screens/note_screen.dart';

import '../models/note.dart';

class ListScreen extends StatefulWidget {
  final List<Note> note;

  ListScreen(this.note);
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isReadmore = false;
  Note m;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade200,
            child: Text(
              '4',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: widget.note.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) => ListTile(
          trailing: SizedBox(
            width: 110.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    removenote(index);
                  },
                ),
              ],
            ),
          ),
          title: Text(widget.note[index].title),
          subtitle: buildText(widget.note[index].content),
          onTap: () async {
            final note = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NoteScreen(Note.copy(widget.note[index]))));
            if (note != null) {
              setState(() {
                widget.note[index].update(note);
              });
            }
            if (note == null) {
              setState(() {});
            }
          },
          onLongPress: () {},
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.unfold_less),
              tooltip: 'Show less. Hide notes content',
              onPressed: () {
                setState(() {
                  isReadmore = !isReadmore;
                });
              }),
          FloatingActionButton(
            child: Icon(Icons.add),
            tooltip: 'Add a new note',
            onPressed: () {
              // addnote(m);
              setState(() {
                widget.note.add(m);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = isReadmore ? null : 1;
    return Text(
      text,
      style: TextStyle(fontSize: 30),
      maxLines: lines,
      // overflow properties is used to show 1 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: isReadmore ? TextOverflow.visible : TextOverflow.visible,
    );
  }

  void removenote(int index) {
    setState(() {
      widget.note.removeAt(index);
    });
  }
}
