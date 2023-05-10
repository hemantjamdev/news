import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/headlines/headline_bloc.dart';
import 'package:news/widgets/search.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/news_widget.dart';
import '../../widgets/shimmer_box.dart';
class NewsLoading extends StatelessWidget {
  const NewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, int index) {
            return loading();
          }),
    );
  }
}