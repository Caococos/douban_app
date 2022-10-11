class Person {
  late String name;
  late String ? avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]?["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

int counter = 1;

class MovieItem {
  late int rank;  //排名
  late String imageURL;  //电影图片
  late String title;  //电影名称
  late String playDate;  //上映时间
  late double rating;  //评分
  late List<String> genres;  //体裁
  late List<Actor> casts;  //演员信息
  late Director director;  //导演信息
  late String originalTitle;  //原名称

  MovieItem.fromMap(Map<String, dynamic> json) {
    rank = counter++;
    imageURL = json["images"]["medium"];
    title = json["title"];
    playDate = json["year"];
    rating = json["rating"]["average"];
    genres = json["genres"].cast<String>();
    casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    director = Director.fromMap(json["directors"][0]);
    originalTitle = json["original_title"];
  }
}
