import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
final double height;
final double width;
  const NewsWidget({super.key, required this.article, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          /* ClipRRect(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.network(
                article.urlToImage ??
                    'https://via.placeholder.com/150x150.png?text=No+Image',
                height: height / 2,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ),*/
          Positioned(
            bottom: 10.0,
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.bottomCenter,
              width: width,
              height: height / 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                article.title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Container(
            height: height / 1.8,
            margin: EdgeInsets.only(bottom: 70, top: 10, left: 30, right: 30),
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
                article.urlToImage ??
                    'https://via.placeholder.com/150x150.png?text=No+Image',
                height: 300.0,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
         /* Positioned(
            top: 16.0,
            right: 16.0,
            child: Icon(
              Icons.bookmark_border,
              color: Colors.black,
              size: 28.0,
            ),
          ),*/
        ],
      ),
    ); /*GestureDetector(
      onTap: () {
        // Navigate to the full news details page
      },
      child: Container(
        height: 300.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                article.urlToImage ??
                    'https://via.placeholder.com/150x150.png?text=No+Image',
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              right: 16.0,
              child: Text(
                article.title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              top: 16.0,
              right: 16.0,
              child: Icon(
                Icons.bookmark_border,
                color: Colors.white,
                size: 28.0,
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
