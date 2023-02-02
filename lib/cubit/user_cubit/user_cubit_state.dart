import 'package:fifth_exam/data/models/random_users/random_users_models.dart';

abstract class UserState {}

class InitialUserState extends UserState {}

/// ----------------- User info State -------------------------------
class LoadUserInProgress extends UserState {}

class LoadUserInSuccess extends UserState {
  LoadUserInSuccess({required this.user});

  final RandomUsersModel user;
}

class LoadUsersInFailure extends UserState {
  LoadUsersInFailure({required this.errorText});

  final String errorText;
}