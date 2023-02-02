class Info {
  String seed;
  dynamic results;
  dynamic page;
  String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"] as String? ?? '',
        results: json["results"] as dynamic? ?? 0,
        page: json["page"] as dynamic? ?? 0,
        version: json["version"] as String? ?? '',
      );
}
