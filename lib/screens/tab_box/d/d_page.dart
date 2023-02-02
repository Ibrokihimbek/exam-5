import 'package:fifth_exam/cubit/notification_get_cubit/notification_cubit.dart';
import 'package:fifth_exam/cubit/notification_get_cubit/notification_state.dart';
import 'package:fifth_exam/data/notification_send_cervice/notificatio_send.dart';
import 'package:fifth_exam/screens/tab_box/d/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DPage extends StatelessWidget {
  const DPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          NotificationCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                String messageId =
                    await NotificationApiService.sendNotificationToAll();
              },
              icon: const Icon(Icons.send_and_archive),
            )
          ],
          title: const Text(
            "D Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<NotificationCubit, NotificationState>(
            listener: (context, state) {
              if (state is LoadNotificationProgress) {
                BlocProvider.of<NotificationCubit>(context);
              }
            },
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
                            imagePath: state.notifications[index].image,
                            title: state.notifications[index].title,
                            description: state.notifications[index].body,
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
