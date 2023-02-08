import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_cubit.dart';
import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_state.dart';
import 'package:fifth_exam/cubit/notification_get_cubit/notification_cubit.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/data/repository/notification_repository.dart';
import 'package:fifth_exam/data/service/local_notification/local_notification_service.dart';
import 'package:fifth_exam/screens/router.dart';
import 'package:fifth_exam/screens/tab_box/a/a_page.dart';
import 'package:fifth_exam/screens/tab_box/b/b_page.dart';
import 'package:fifth_exam/screens/tab_box/c/c_page.dart';
import 'package:fifth_exam/screens/tab_box/d/d_page.dart';
import 'package:fifth_exam/screens/tab_box/e/e_page.dart';
import 'package:fifth_exam/screens/tab_box/tab_cubit/tab_cubit.dart';
import 'package:fifth_exam/data/service/locator/locator_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBoxPage extends StatefulWidget {
  const TabBoxPage({super.key});

  @override
  State<TabBoxPage> createState() => _TabBoxPageState();
}

class _TabBoxPageState extends State<TabBoxPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget> screens = [];

  @override
  void initState() {
    _init();
    screens.add(APage());
    screens.add(BPage());
    screens.add(CPage());
    screens.add(DPage());
    screens.add(EPage());
    super.initState();
  }

  _init() async {
    _notificationOnMessage();
    _setupInteractedMessage();
  }

  _notificationOnMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //LocalNotification
      addToSQL(message);
    });
  }

  _setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    //Terminateddan kirganda bu ishlaydi
    if (initialMessage != null) {
      addToSQL(initialMessage);
    }

    //Backgounddan kirganda shu ishlaydi
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      addToSQL(message);
      String routeName = message.data["route"];
      var notification = NotificationModel(
        title: message.data['title'],
        date: DateTime.now().toString(),
        description: message.data['description'],
        image: message.data['image'],
      );
      Navigator.pushNamed(context, routeName, arguments: notification);
      print("ON MESSAGE OPPENED APPDA QOSHILDI");
    });
  }

  void addToSQL(RemoteMessage remoteMessage) async {
    LocalNotificationService.localNotificationService
        .showNotificationByPushNotification(id: 1000);
    var notification = NotificationModel(
      title: remoteMessage.data['title'],
      date: DateTime.now().toString(),
      description: remoteMessage.data['description'],
      image: remoteMessage.data['image'],
    );
    await appLocator
        .get<NotificationRepository>()
        .addNotification(notificationModel: notification);
    if (!mounted) return;
    BlocProvider.of<NotificationCubit>(context).getAllNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          var index = context.watch<BottomNavCubit>().activePageIndex;
          return BlocListener<ConnectivityCubit, ConnectivityState>(
            listener: (context, state) {
              if (state.connectivityResult == ConnectivityResult.none) {
                Navigator.pushNamed(
                  context,
                  RoutName.noInternetRoute,
                  arguments: _init,
                );
              }
            },
            child: Scaffold(
              key: _key,
              body: screens[index],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: index,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.blue,
                onTap: (value) => BlocProvider.of<BottomNavCubit>(context)
                    .changePageIndex(value),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    label: "A",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    label: "B",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.password,
                      size: 30,
                    ),
                    label: "C",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                    label: "D",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications_active_rounded,
                      size: 30,
                    ),
                    label: "E",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
