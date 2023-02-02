import 'package:equatable/equatable.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationState extends Equatable {
  final Notificationtatus status;
  final String statusText;
  final List<NotificationModel> notification;

  const NotificationState({
    required this.status,
    required this.statusText,
    required this.notification,
  });

  NotificationState copyWith({
    Notificationtatus? status,
    List<NotificationModel>? notification,
    String? statusText,
  }) =>
      NotificationState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        notification: notification ?? this.notification,
      );

  @override
  List<Object?> get props => [
        status,
        statusText,
        notification,
      ];
}

enum Notificationtatus {
  loading,
  pure,
  notificationAdded,
  notificationUpdated,
  notificationDeleted,
}