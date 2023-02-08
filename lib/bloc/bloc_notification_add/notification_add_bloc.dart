import 'package:fifth_exam/bloc/bloc_notification_add/notification_add_event.dart';
import 'package:fifth_exam/bloc/bloc_notification_add/notification_add_state.dart';
import 'package:fifth_exam/data/repository/notification_repository.dart';
import 'package:fifth_exam/data/service/locator/locator_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc()
      : super(const NotificationState(
          notification: [],
          statusText: "",
          status: Notificationtatus.pure,
        )) {
    on<AddNotification>(_addNotification);
  }

  _addNotification(
      AddNotification event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(status: Notificationtatus.loading));
    var newNotification = await appLocator
        .get<NotificationRepository>()
        .addNotification(notificationModel: event.notificationModel);
    if (newNotification.id != null) {
      emit(state.copyWith(status: Notificationtatus.notificationAdded));
    }
  }
}
