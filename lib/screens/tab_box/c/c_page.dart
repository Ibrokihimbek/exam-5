import 'package:flutter/material.dart';

class CPage extends StatefulWidget {
  const CPage({super.key});

  @override
  State<CPage> createState() => _CPageState();
}

class _CPageState extends State<CPage> {
  String passwordOne = '';
  String passwordTwo = '';
  String passwordThre = '';
  String passwordFor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('C Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            bottom: 30,
            top: 150,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  codeVerification(password: passwordOne),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordTwo),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordThre),
                  const SizedBox(width: 8),
                  codeVerification(password: passwordFor)
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 90,
                  ),
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (passwordOne.isEmpty) {
                              passwordOne = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                            } else if (passwordTwo.isEmpty) {
                              passwordTwo = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                            } else if (passwordThre.isEmpty) {
                              passwordThre = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                            } else if (passwordFor.isEmpty) {
                              passwordFor = index == 9
                                  ? ''
                                  : index == 10
                                      ? '0'
                                      : (index + 1).toString();
                            }
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == 9 || index == 11
                              ? Colors.transparent
                              : Colors.grey.shade300,
                        ),
                        child: Center(
                          child: index == 11
                              ? const Icon(Icons.backspace)
                              : Text(
                                  index == 9 || index == 11
                                      ? ''
                                      : index == 10
                                          ? '0'
                                          : (index + 1).toString(),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget codeVerification({required String password}) {
    return Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Center(
          child: Text(
        password,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      )),
    );
  }
}
