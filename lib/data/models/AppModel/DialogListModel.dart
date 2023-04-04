
class DialogListModel {
  String id;
  String title;
  String subtitle;

  DialogListModel(this.id, this.title, this.subtitle);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
