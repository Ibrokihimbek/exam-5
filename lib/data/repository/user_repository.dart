import 'package:fifth_exam/data/api_service/api_service.dart';
import 'package:fifth_exam/data/models/my_responce/response_model.dart';

class UserRepository {
  UserRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getCompany() => apiService.getUser();     
}