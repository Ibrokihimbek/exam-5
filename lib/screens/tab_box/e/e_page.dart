import 'dart:math';

import 'package:fifth_exam/data/service/local_notification/local_notification_service.dart';
import 'package:fifth_exam/data/service/shuffle/shuffle.dart';
import 'package:flutter/material.dart';

class EPage extends StatefulWidget {
  const EPage({super.key});

  @override
  State<EPage> createState() => _EPageState();
}

class _EPageState extends State<EPage> {
  int currentId = 1;
  int currentIndex = 0;
  String buttontext = 'Next';
  num randomOne = Random().nextInt(10) + 20;
  num randomTwo = Random().nextInt(10) + 1;
  num c = 0;

  void generateNumbers() {
    randomOne = Random().nextInt(10) + 20;
    randomTwo = Random().nextInt(10) + 1;
  }

  String truAnsver = '';
  @override
  Widget build(BuildContext context) {
    List number = [
      randomOne + randomTwo,
      Random().nextInt(20),
      Random().nextInt(20),
      Random().nextInt(20),
    ];
    c = randomOne + randomTwo;
    number = shuffle(number);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                currentId++;

                LocalNotificationService.localNotificationService
                    .showPeriodically(id: currentId);
              },
              icon: const Icon(Icons.notification_important))
        ],
        title: const Text("Local Notification"),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$randomOne",
                    style: const TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  const Text(
                    "+",
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  Text(
                    '$randomTwo',
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: number.length,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5 / 1.1,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return answersItem(
                      number[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answersItem(number) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        MediaQuery.of(context).size.height * 0.04,
      ),
      onTap: () {
        truAnsver = number.toString();
        if (c.toString() == truAnsver) {
          currentId++;
          LocalNotificationService.localNotificationService
              .showNotification(id: currentId);
        } else {
          currentId++;
          LocalNotificationService.localNotificationService
              .scheduleNotification(
            id: currentId,
            delayedTime: 100,
          );
        }
        nextQuestion();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.height * 0.04,
          ),
        ),
        margin: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }

  nextQuestion() {
    setState(
      () {
        generateNumbers();
        if (currentIndex != 10) {
          truAnsver = '';
          currentIndex++;
        }
      },
    );
  }
}