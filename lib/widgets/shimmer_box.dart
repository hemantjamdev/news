import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loading() {
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
    child: Stack(
      children: [

        Positioned(
          bottom: 10.0,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomCenter,
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              /*gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),*/
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),

          ),
        ),
        Container(
          height: 500,
          width: 300,
          margin: EdgeInsets.only(bottom: 70, top: 10, left: 20, right: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10.0,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              'https://via.placeholder.com/150x150.png?text=No+Image',
              height: 300.0,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),

      ],
    ),
  );
}
