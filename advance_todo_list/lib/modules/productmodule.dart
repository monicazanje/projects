class ToDOModel {
  final String id;
  final String title;
  final String description;
  final String date;

  ToDOModel( 
      {required this.title, required this.description, required this.date,required this.id});


  Map<String, dynamic> todomap() {
    return {
      'flag': id,
      'title': title,
      'description': description,
      'date': date
    };
  }

  @override
  String toString() {
    return '{flag :$id,title:$title,description:$description,date:$date}';
  }
}
