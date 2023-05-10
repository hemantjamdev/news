import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/constants/strings.dart';
import 'package:news/modules/internet/internet_bloc.dart';
import 'package:news/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/home_page.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.onRouteGenerate,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: BlocProvider<InternetBloc>(
        create: (context) => InternetBloc(),
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, InternetState state) {
            if (state is InternetSuccess) {
              return HomePage();
            } else if (state is InternetFailure) {
              return NoInternet();
            } else {
              return NoInternet();
            }
          },
        ),
      ),
    );
  }
}

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
