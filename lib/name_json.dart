class Name {
  final String name;

  Name({this.name});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      name: json['name'],
    );
  }
}
