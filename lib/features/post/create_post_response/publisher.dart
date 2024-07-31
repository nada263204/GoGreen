class Publisher {
  String? name;
  dynamic id;

  Publisher({this.name, this.id});

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
        name: json['name'] as String?,
        id: json['id'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
      };
}
