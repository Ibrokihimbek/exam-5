class Timezone {
  String offset;
  String description;
  Timezone({
    required this.offset,
    required this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"] as String? ?? '',
        description: json["description"] as String? ?? '',
      );
}
