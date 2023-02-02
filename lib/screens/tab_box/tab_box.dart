import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/bloc/bloc_notification_add/notification_add_bloc.dart';
import 'package:fifth_exam/bloc/bloc_notification_add/notification_add_state.dart';
import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_cubit.dart';
import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_state.dart';
import 'package:fifth_exam/cubit/notification_get_cubit/notification_cubit.dart';
import 'package:fifth_exam/screens/router.dart';
import 'package:fifth_exam/screens/tab_box/a/a_page.dart';
import 'package:fifth_exam/screens/tab_box/b/b_page.dart';
import 'package:fifth_exam/screens/tab_box/c/c_page.dart';
import 'package:fifth_exam/screens/tab_box/d/d_page.dart';
import 'package:fifth_exam/screens/tab_box/tab_cubit/tab_cubit.dart';
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
    screens.add(APage());
    screens.add(BPage());
    screens.add(CPage());
    screens.add(DPage());
    super.initState();
  }

  _init() async {
    print("INTERNET TURNED ON CALL ANY API");
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
