class Street {
  dynamic number;
  String name;
  Street({
    required this.number,
    required this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"]as dynamic? ?? 0,
        name: json["name"]as String? ?? '',
      );
}
