class Post {
  String? title;
  String? content;

  Post({this.title, this.content}) {
    title = title;
    content = content;
  }

  toJson() {
    return {
      "content": content,
      "title": title,
    };
  }

  fromJson(jsonData) {
    return Post(
      title: jsonData['title'],
      content: jsonData['content'],
    );
  }
}
