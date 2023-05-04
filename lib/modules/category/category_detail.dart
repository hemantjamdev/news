import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../../widgets/headline_loading.dart';
import '../../widgets/news_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryName;

  const CategoryDetails({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(FetchCategoryDetails(categoryName));
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, CategoryState state) {
          if (state is CategoryLoaded) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, int index) {
                Article news = state.articles[index];
                return NewsWidget(article: news);
              },
            );
          } else if (state is CategoryLoading) {
            return headLineLoading();
          } else {
            return const Center(
              child: Text("something went wrong ! please try again"),
            );
          }
        },
      ),
    );
  }
}
