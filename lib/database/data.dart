

// ignore_for_file: public_member_api_docs, sort_constructors_first
//where we are going to prepare our models

class Notes {
  int ? id;
  String title;
  String content;
  DateTime date;
  Notes({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
  });
  


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Notes.fromJson(Map<String, dynamic> json) {
    return Notes(
      id: json['id'],
      title: json['title'] ,
      content: json['content'] ,
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
    );
  }


}
