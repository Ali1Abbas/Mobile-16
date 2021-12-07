//! Define the model class Note here

class Note {
  String title;
  String content;

  Note(this.title, this.content);

  Note.copy(Note obj) : this((obj.title), (obj.content));

  update(Note to) {
    this.title = to.title;
    this.content = to.content;
  }
}
