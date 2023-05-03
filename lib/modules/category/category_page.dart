import 'dart:math';

import 'package:flutter/material.dart';

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
  final List<double> heights = [20, 50, 30, 190, 190, 180, 350, 360, 340, 450];
  final List<double> widths = [20, 180, 250, 30, 100, 280, 30, 180, 280, 155];
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.brown,
  ];

  CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            for (int i = 0; i < categories.length; i++)
              Positioned(
                top: heights[i],
                left: widths[i],
                child: Container(
                  width: 150.0,
                  height: 150,
                  decoration: BoxDecoration(
                    color: colors[i % colors.length],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://via.placeholder.com/300x300.png?text=${categories[i].toString()}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      categories[i],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
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
