class Post {
  String? time;

  Post({this.time}) {
    time = time;
  }

  toJson() {
    return {
      "time": time,
    };
  }

  fromJson(jsonData) {
    return Post(
      time: jsonData['time'],
    );
  }
}
