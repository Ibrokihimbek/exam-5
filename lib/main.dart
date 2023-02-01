import 'package:fifth_exam/bloc/user_cubit/user_cubit_cubit.dart';
import 'package:fifth_exam/screens/tab_box/tab_box.dart';
import 'package:fifth_exam/service/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locatorSetUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
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
      debugShowCheckedModeBanner: false,
      title: 'Fifth Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBoxPage(),
    );
  }
}
