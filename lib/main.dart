import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_cubit.dart';
import 'package:fifth_exam/cubit/notification_get_cubit/notification_cubit.dart';
import 'package:fifth_exam/cubit/user_cubit/user_cubit_cubit.dart';
import 'package:fifth_exam/data/local_db/local_database.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/data/service/local_notification/local_notification_service.dart';
import 'package:fifth_exam/screens/router.dart';
import 'package:fifth_exam/data/service/locator/locator_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  var notification = NotificationModel(
    title: message.data['title'],
    date: DateTime.now().toString(),
    description: message.data['description'],
    image: message.data['image'],
    //status: false
  );
  LocalDatabase.addNotification(notification);
  print("ON BACKGROUNDDA QO'SHILDI");
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("news");

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  locatorSetUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(create: (context) => ConnectivityCubit()),
        BlocProvider(
          create: (BuildContext context) => NotificationCubit(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MaterialApp(
      initialRoute: RoutName.tabBox,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Fifth Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
    );
  }
}
