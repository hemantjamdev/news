import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/constants/strings.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Lottie.asset(Strings.noInternet, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
