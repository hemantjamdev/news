import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/widgets/new_loading.dart';
import 'package:news/widgets/news_list.dart';
import '../../widgets/search.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryName;

  const CategoryDetails({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context)
        .add(FetchCategoryDetails(categoryName));
    return Scaffold(
      appBar: AppBar(title: Text(categoryName.toUpperCase())),
      body: Column(
        children: [
          Search(
            onSearch: (query) {
              BlocProvider.of<CategoryBloc>(context).add(SearchCategory(
                  query, categoryName == "All" ? "general" : categoryName));
            },
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, CategoryState state) {
              if (state is CategoryLoading) {
                return const NewsLoading();
              } else if (state is CategoryLoaded) {
                return NewsList(
                    articles: state
                        .articles);
              } else {
                return const Expanded(
                  child: Center(
                      child: Text("something went wrong ! please try again")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
