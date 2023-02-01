class Id {
  String name;
  String value;

  Id({
    required this.name,
    required this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"] as String? ?? '',
        value: json["value"] as String? ?? '',
      );
}
