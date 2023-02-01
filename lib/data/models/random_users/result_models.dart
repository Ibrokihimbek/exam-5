import 'package:fifth_exam/data/models/random_users/dob_model.dart';
import 'package:fifth_exam/data/models/random_users/id_model.dart';
import 'package:fifth_exam/data/models/random_users/location_model.dart';
import 'package:fifth_exam/data/models/random_users/login_model.dart';
import 'package:fifth_exam/data/models/random_users/name_model.dart';
import 'package:fifth_exam/data/models/random_users/picture_model.dart';

class Result {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  Dob dob;
  Dob registered;
  String phone;
  String cell;
  Id id;
  Picture picture;
  String nat;
  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: json["gender"] as String? ?? '',
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"] as String? ?? '',
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Dob.fromJson(json["registered"]),
        phone: json["phone"] as String? ?? '',
        cell: json["cell"]as String? ?? '',
        id: Id.fromJson(json["id"]),
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"] as String? ?? '',
      );
}
