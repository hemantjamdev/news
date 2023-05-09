import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});

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
  final List<double> top = [10, 5, 150, 165, 310, 350, 520, 530];
  final List<double> right = [10, 250, 80, 250, 20, 200, 40, 200];
  final List<Color> colors = [
    AppColors.red,
    AppColors.green,
    AppColors.blue,
    AppColors.orange,
    AppColors.purple,
    AppColors.black38,
    AppColors.teal,
    AppColors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.grey,
        title: const Text("Categories"),
      ),
      backgroundColor: AppColors.grey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.grey,
            border: Border.all(color: AppColors.black, width: 3)),
        child: Stack(
          children: [
            for (int i = 0; i < categories.length; i++)
              Positioned(
                top: top[i],
                left: right[i],
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/categoryDetails",
                        arguments: categories[i]);
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
                          color: AppColors.white,
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
