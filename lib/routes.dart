import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/constants/route_name.dart';
import 'package:news/presentation/full_article_web_page.dart';
import 'package:news/presentation/home_page.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/modules/category/category_detail.dart';
import 'package:news/presentation/news_details_page.dart';
import 'package:news_api_flutter_package/model/article.dart';

import 'modules/internet/internet_bloc.dart';

class Routes {
  static Route? onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homepage:
        return MyCustomRoute(
            builder: (_) => BlocProvider<InternetBloc>(
                  create: (context) => InternetBloc(),
                  child: const HomePage(),
                ),
            settings: settings);
      case RouteNames.fullArticle:
        return MyCustomRoute(
            builder: (_) => FullArticle(url: settings.arguments as String),
            settings: settings);
      case RouteNames.newsDetails:
        return MyCustomRoute(
            builder: (_) => NewsDetails(
                  article: settings.arguments as Article,
                ),
            settings: settings);
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
  final begin = const Offset(0.0, 1.0);
  final end = Offset.zero;
  final curve = Curves.ease;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(position: animation.drive(tween), child: child);
  }
}
