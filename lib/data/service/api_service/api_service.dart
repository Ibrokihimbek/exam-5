import 'package:dio/dio.dart';
import 'package:fifth_exam/data/service/api_service/api_client.dart';
import 'package:fifth_exam/data/models/my_responce/response_model.dart';
import 'package:fifth_exam/data/models/random_users/random_users_models.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getUser() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get(dio.options.baseUrl);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        myResponse.data = RandomUsersModel.fromJson(response.data);
      }
    } catch (err) {
      myResponse.error = err.toString();
    }

    return myResponse;
  }
}