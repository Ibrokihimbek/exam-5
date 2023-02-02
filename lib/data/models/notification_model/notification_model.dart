const String tableName = "notification_fifth_exam";

class NotificationFields {
  static final List<String> values = [
    /// Add all fields
    id, title, body, date, image
  ];
  static const String id = "_id";
  static const String title = "title";
  static const String body = "body";
  static const String date = "date";
  static const String image = "image";
}

class NotificationModel {
  final int? id;
  final String body;
  final String title;
  final String date;
  final String image;

  NotificationModel(
      {this.id,
      required this.title,
      required this.date,
      required this.body,
      required this.image});

  NotificationModel copyWith(
          {int? id,
          String? title,
          String? body,
          String? date,
          String? image}) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        date: date ?? this.date,
        image: image ?? this.image,
      );

  static NotificationModel fromJson(Map<String, Object?> json) =>
      NotificationModel(
        id: json[NotificationFields.id] as int?,
        title: json[NotificationFields.title] as String,
        body: json[NotificationFields.body] as String,
        date: json[NotificationFields.date] as String,
        image: json[NotificationFields.image] as String,
      );

  Map<String, Object?> toJson() => {
        NotificationFields.id: id,
        NotificationFields.title: title,
        NotificationFields.date: date,
        NotificationFields.body: body,
        NotificationFields.image: image,
      };

  @override
  String toString() => '''
        ID: $id 
        USER NAME $title
        SUMM $body
        DATE $date
        ImAGE $image
      ''';
}
