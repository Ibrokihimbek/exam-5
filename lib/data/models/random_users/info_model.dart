class Info {
  String seed;
  int results;
  int page;
  String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"] as String? ?? '',
        results: json["results"] as int? ?? 0,
        page: json["page"] as int? ?? 0,
        version: json["version"] as String? ?? '',
      );
}
