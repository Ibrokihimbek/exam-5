const String tableName = "notification_fifth_exam";

class NotificationFields {
  static final List<String> values = [
    /// Add all fields
    id, title, description, date, image
  ];
  static const String id = "_id";
  static const String title = "title";
  static const String description = "body";
  static const String date = "date";
  static const String image = "image";
}

class NotificationModel {
  final int? id;
  final String description;
  final String title;
  final String date;
  final String image;

  NotificationModel(
      {this.id,
      required this.title,
      required this.date,
      required this.description,
      required this.image});

  NotificationModel copyWith(
          {int? id,
          String? title,
          String? description,
          String? date,
          String? image}) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        image: image ?? this.image,
      );

  static NotificationModel fromJson(Map<String, Object?> json) =>
      NotificationModel(
        id: json[NotificationFields.id] as int?,
        title: json[NotificationFields.title] as String,
        description: json[NotificationFields.description] as String,
        date: json[NotificationFields.date] as String,
        image: json[NotificationFields.image] as String,
      );

  Map<String, Object?> toJson() => {
        NotificationFields.id: id,
        NotificationFields.title: title,
        NotificationFields.date: date,
        NotificationFields.description: description,
        NotificationFields.image: image,
      };

  @override
  String toString() => '''
        ID: $id 
        USER NAME $title
        SUMM $description
        DATE $date
        ImAGE $image
      ''';
}
