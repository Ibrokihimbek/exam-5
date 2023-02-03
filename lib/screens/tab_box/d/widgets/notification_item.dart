import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notificationModel;

  const NotificationItem({
    super.key,
    required this.notificationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 110,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(6, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Container(
        padding: const EdgeInsets.all(1),
        child: Row(
          children: [
            Image.network(
              notificationModel.image,
              width: 70,
            ),
            const SizedBox(width: 12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notificationModel.title),
                const SizedBox(height: 8),
                Text(notificationModel.description),
              ],
            )
          ],
        ),
      ),
    );
  }
}
