
import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';
import 'package:news_api_flutter_package/model/article.dart';

class NewsWidget extends StatelessWidget {
  final Article article;
  final double height;
  final double width;

  const NewsWidget(
      {super.key,
      required this.article,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 10.0,
            child: Container(
              padding: const EdgeInsets.all(10),
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
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                article.title ?? '',
                style: const TextStyle(
                  color: AppColors.white,
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
            margin: const EdgeInsets.only(bottom: 70, top: 10, left: 30, right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.0,
                  offset: const Offset(0, 10),
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
        ],
      ),
    );
  }
}
