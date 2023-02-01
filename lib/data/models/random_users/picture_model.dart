class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"] as String? ?? '',
        medium: json["medium"] as String? ?? '',
        thumbnail: json["thumbnail"] as String? ?? '',
      );
}
