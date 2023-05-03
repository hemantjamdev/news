import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loading([double height = 300, double width = 300]) {
  return Shimmer(
    gradient: LinearGradient(
      colors: [
        Colors.grey[100]!,
        Colors.grey[400]!,
        Colors.grey[600]!,
      ],
      begin: Alignment(-1.0, -0.5),
      end: Alignment(1.0, 0.5),
      stops: [0.0, 0.5, 1.0],
    ),

    child: Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            'https://via.placeholder.com/150x150.png?text=No+Image',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.1),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    ),
  );
}
