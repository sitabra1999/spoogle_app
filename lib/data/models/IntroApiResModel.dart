/// variant : [{"unit":"1Kg","qty":"100","price":"10"},{"unit":"2kg","qty":"100","price":"20"}]

class IntroApiResModel {
  String title;
  String description;
  String logo;

  IntroApiResModel(this.title, this.description, this.logo);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'cost': logo,
    };
  }
}