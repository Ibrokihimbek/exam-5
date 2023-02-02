import 'package:fifth_exam/data/models/random_users/coordinate_model.dart';
import 'package:fifth_exam/data/models/random_users/street_model.dart';
import 'package:fifth_exam/data/models/random_users/timezone_model.dart';

class Location {
  Street street;
  String city;
  String state;
  String country;
  dynamic postcode;
  Coordinates coordinates;
  Timezone timezone;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"] as String? ?? '',
        state: json["state"] as String? ?? '',
        country: json["country"] as String? ?? '',
        postcode: json["postcode"] as dynamic? ?? 0,
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
      );
}
