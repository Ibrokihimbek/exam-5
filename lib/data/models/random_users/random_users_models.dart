import 'package:fifth_exam/data/models/random_users/info_model.dart';

import 'result_models.dart';

class RandomUsersModel {
  List<Result> results;
  Info info;
  
  RandomUsersModel({
    required this.results,
    required this.info,
  });

  factory RandomUsersModel.fromJson(Map<String, dynamic> json) =>
      RandomUsersModel(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
      );
}
