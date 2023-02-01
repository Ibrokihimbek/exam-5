class Name {
  String title;
  String first;
  String last;

  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"] as String? ?? '',
        first: json["first"] as String? ?? '',
        last: json["last"] as String? ?? '',
      );
}
