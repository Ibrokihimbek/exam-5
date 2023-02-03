import 'package:fifth_exam/cubit/notification_get_cubit/notification_cubit.dart';
import 'package:fifth_exam/cubit/notification_get_cubit/notification_state.dart';
import 'package:fifth_exam/data/local_db/local_database.dart';
import 'package:fifth_exam/data/notification_send_cervice/notificatio_send.dart';
import 'package:fifth_exam/screens/tab_box/d/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DPage extends StatelessWidget {
  const DPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          IconButton(
            onPressed: () async {
              String messageId =
                  await NotificationApiService.sendNotificationToAll();
            },
            icon: const Icon(Icons.send_and_archive),
          ),
          IconButton(
            onPressed: () async {
              LocalDatabase.deleteAllNotification();
              BlocProvider.of<NotificationCubit>(context).getAllNotifications();
            },
            icon: const Icon(Icons.delete),
          ),

          IconButton(
            onPressed: () async {
              BlocProvider.of<NotificationCubit>(context).getAllNotifications();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
        title: const Text(
          "D Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is LoadNotificationProgress) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadNotificationSuccess) {
              return Column(
                children: [
                  ...List.generate(
                    state.notifications.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NotificationItem(
                          notificationModel: state.notifications[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                const SizedBox(height: 10),
                const Text(
                  'You don`t have an notification',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
