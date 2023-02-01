import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/bloc/conecctivity/connectivity_cubit.dart';
import 'package:fifth_exam/bloc/conecctivity/connectivity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key, required this.voidCallback})
      : super(key: key);

  final VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Expanded(
              child: Center(
                  child: Text(
                'No Internet',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
              )),
            ),
            BlocListener<ConnectivityCubit, ConnectivityState>(
              listener: (context, state) {
                if (state.connectivityResult != ConnectivityResult.none) {
                  voidCallback.call();
                  Navigator.pop(context);
                }
              },
              child: const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
