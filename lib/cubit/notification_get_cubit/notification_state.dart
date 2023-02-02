import 'package:fifth_exam/data/models/notification_model/notification_model.dart';

abstract class NotificationState {}

class InitialNotificationState extends NotificationState {}

class LoadNotificationProgress extends NotificationState {}

class LoadNotificationSuccess extends NotificationState {
  LoadNotificationSuccess({required this.notifications});

  final List<NotificationModel> notifications;
}

class LoadNotificationFailure extends NotificationState {}