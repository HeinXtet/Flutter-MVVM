class Todo {
  final int userId;
  final int id;
  final String title;

  Todo(this.userId, this.id,this.title);

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title' :title
  };

  @override
  String toString() {
   return "$userId $id $title";
  }
}