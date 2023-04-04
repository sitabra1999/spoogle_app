class Comment {
  // ignore: constant_identifier_names
  static const TAG = 'Comment';

  String? avatar;
  String? userName;
  String? content;
  String? parentId;
  String? postTime;

  Comment({
    required this.avatar,
    required this.userName,
    required this.content,
    required this.parentId,
    required this.postTime
  });
}
