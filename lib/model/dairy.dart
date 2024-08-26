class Dairy {
  final int id;
  final String title;
  final String content;
  final String createdAt;
  String? updatedAt;

  Dairy({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.updatedAt
  });

factory Dairy.fromSql(Map<String,dynamic> map)=>Dairy(
      id:map['id'].toInt()??0,
      title:map['title']??'',
      content:map['content']??'',
      createdAt: map['created_at'] ?? DateTime.now()
  );
}
