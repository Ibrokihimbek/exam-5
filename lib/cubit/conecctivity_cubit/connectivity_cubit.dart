import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fifth_exam/cubit/conecctivity_cubit/connectivity_state.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(
            ConnectivityState(connectivityResult: ConnectivityResult.mobile)) {
    checkInternet();
  }

  final Connectivity _connectivity = Connectivity();

  checkInternet() {
    initConnectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      emit(state.copyWith(connectivityResult: event));
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    emit(state.copyWith(connectivityResult: result));
  }
}
