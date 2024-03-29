class TrendTopic {
  String? location;
  String? hashtag;
  String? tweet;

  TrendTopic({this.location, this.hashtag, this.tweet});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    hashtag = json['hashtag'];
    tweet = json[' tweet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['hashtag'] = hashtag;
    data[' tweet'] = tweet;
    return data;
  }
}
