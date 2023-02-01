import 'package:fifth_exam/bloc/user_cubit/user_cubit_state.dart';
import 'package:fifth_exam/data/models/my_responce/response_model.dart';
import 'package:fifth_exam/data/repository/user_repository.dart';
import 'package:fifth_exam/service/locator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUserState()) {
    fetchAllUser();
  }

  fetchAllUser() async {
    emit(LoadUserInProgress());
    MyResponse myResponse = await appLocator.get<UserRepository>().getCompany();
    if (myResponse.error.isEmpty) {
      emit(LoadUserInSuccess(user: myResponse.data));
    } else {
      emit(LoadUsersInFailure(errorText: myResponse.error));
    }
  }
}
