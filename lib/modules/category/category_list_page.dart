import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/category/category_bloc.dart';
import 'package:news/modules/category/category_detail.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    "All",
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  /*business
  entertainment
  general
  health
  science
  sports
  technology*/
  final List<double> top = [10, 5, 150, 165, 310, 350, 520, 530];
  final List<double> right = [10, 250, 80, 250, 20, 200, 40, 200];
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.black38,
    Colors.teal,
    Colors.greenAccent,
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text("Categories"),
      ),
      backgroundColor: Colors.grey,
      body: Container(
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
                    Navigator.pushNamed(
                      context,
                      "/categoryDetails",
                      arguments: categories[i],
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
      ),
    );
  }
}
