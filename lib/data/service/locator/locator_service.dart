import 'package:fifth_exam/data/service/api_service/api_service.dart';
import 'package:fifth_exam/data/repository/notification_repository.dart';
import 'package:fifth_exam/data/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final appLocator = GetIt.instance;

Future<void> locatorSetUp() async {
  var apiService = ApiService();
  appLocator
      .registerLazySingleton(() => UserRepository(apiService: apiService));
  appLocator.registerLazySingleton(() => NotificationRepository());
}
