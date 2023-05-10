import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/route_name.dart';
import 'package:news/constants/strings.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Lottie.asset(Strings.splash, fit: BoxFit.fill, repeat: false,
            onLoaded: (LottieComposition value) {
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context,RouteNames.homepage);
          });
        }),
      ),
    );
  }
}
