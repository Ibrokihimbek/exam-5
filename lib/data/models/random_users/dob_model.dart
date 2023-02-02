class Dob {
  DateTime date;
  dynamic age;

  Dob({
    required this.date,
    required this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"]as dynamic? ?? 0,
      );
}
