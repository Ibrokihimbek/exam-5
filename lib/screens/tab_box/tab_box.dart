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
  List<Widget> screens = [];
  @override
  void initState() {
    screens.add(APage());
    screens.add(BPage());
    screens.add(CPage());
    screens.add(DPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          var index = context.watch<BottomNavCubit>().activePageIndex;
          return Scaffold(
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
          );
        },
      ),
    );
  }
}
