import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants/route_name.dart';
import 'package:news/presentation/home_page.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/modules/category/category_detail.dart';
import 'package:news/modules/headlines/headline_page.dart';

class Routes {
  static Route? onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return MyCustomRoute(
            builder: (_) => const HomePage(), settings: settings);
      case RouteNames.headLinePage:
        return MyCustomRoute(
            builder: (_) => const HeadLinePage(), settings: settings);

      case RouteNames.categoryDetails:
        return MyCustomRoute(
            builder: (_) => BlocProvider<CategoryBloc>(
                  create: (context) => CategoryBloc(),
                  child: CategoryDetails(
                      categoryName: settings.arguments as String),
                ),
            settings: settings);
    }
    return null;
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute(
      {required WidgetBuilder builder, required RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
