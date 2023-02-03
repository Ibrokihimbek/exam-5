import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:flutter/material.dart';


class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key, required this.notificationModel}) : super(key: key);
  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Detail page"),),
    );
  }
}
