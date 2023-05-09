import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/widgets/shimmer_box.dart';
import 'package:news_api_flutter_package/model/article.dart';
import '../../widgets/news_widget.dart';
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
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, int index) {
                        return loading();
                      }),
                );
              } else if (state is CategoryLoaded) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.articles.length,
                        itemBuilder: (context, int index) {
                          Article news = state.articles[index];
                          return NewsWidget(
                            article: news,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                          );
                        }),
                  ),
                );
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
