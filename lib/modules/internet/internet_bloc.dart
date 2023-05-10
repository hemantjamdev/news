import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  InternetBloc() : super(InternetInitial()) {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
          log("---> checking for internet <-----");
      if (result == ConnectivityResult.none) {
        add(InternetLoss());
      } else {
        add(InternetGained());
      }
    });
    on<InternetEvent>((event, emit) {
      if (event is InternetGained) {
        emit(InternetSuccess());
      } else if (event is InternetLoss) {
        emit(InternetFailure());
      }
    });
  }

  dispose() {
    _connectivitySubscription.cancel();
    super.close();
  }
}
