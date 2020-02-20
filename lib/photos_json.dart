class Photos {
  final String thumbnailUrl;

  Photos({this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
