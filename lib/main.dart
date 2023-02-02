import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_cubit.dart';
import 'package:fifth_exam/cubit/user_cubit/user_cubit_cubit.dart';
import 'package:fifth_exam/data/local_db/local_database.dart';
import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/screens/router.dart';
import 'package:fifth_exam/service/locator_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await LocalDatabase.addNotification(NotificationModel(
    title: message.notification!.title.toString(),
    date: DateTime.now().toString(),
    body: message.notification!.body.toString(),
    image: message.data['news_image'],
  ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic("news");
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) async {
      await LocalDatabase.addNotification(
        NotificationModel(
          title: message.notification!.title.toString(),
          date: DateTime.now().toString(),
          body: message.notification!.body.toString(),
          image: message.data['news_image'],
        ),
      );
    },
  );
  locatorSetUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(create: (context) => ConnectivityCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutName.tabBox,
      onGenerateRoute: AppRoutes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Fifth Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
