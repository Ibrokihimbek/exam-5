import 'package:fifth_exam/cubit/notification_get_cubit/notification_state.dart';
import 'package:fifth_exam/data/local_db/local_database.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(InitialNotificationState()) {
    getAllNotifications();
  }

  getAllNotifications() {
    emit(LoadNotificationProgress());
    LocalDatabase.getAllNotifications()
        .asStream()
        .listen((List<NotificationModel> notifications) {
      emit(LoadNotificationSuccess(notifications: notifications));
    });
  }
}