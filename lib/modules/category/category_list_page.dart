import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/modules/category/category_detail.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    'Technology',
    'Science',
    'Sports',
    'Entertainment',
    'Politics',
    'Business',
    'Health',
    'Fashion',
    'Food',
    'Travel',
  ];
  final List<double> top = [10, 5, 150, 165, 290, 290, 430, 410, 570, 570];
  final List<double> right = [10, 250, 80, 250, 2, 155, 80, 250, 5, 220];
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.black38,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.brown,
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context).add(FetchSourcesList());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text("Categories"),
      ),
      backgroundColor: Colors.grey,
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is SourceLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourceLoaded) {
          return Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey,
                border: Border.all(color: Colors.black, width: 3)),
            child: Stack(
              children: [
                for (int i = 0; i < categories.length; i++)
                  Positioned(
                    top: top[i],
                    left: right[i],
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CategoryDetails(categoryName: categories[i]),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: colors[i % colors.length],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            categories[i],
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
