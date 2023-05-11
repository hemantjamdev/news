import 'package:flutter/material.dart';
import 'package:news/constants/colors.dart';
import 'package:news/constants/route_name.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:sizer/sizer.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.newsDetails,
            arguments: article);
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: 100.w,
              height: 20.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.black,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                color: Colors.grey.withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(80),
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(
                article.title ?? '',
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 60.h,
              width: 80.w,
              margin: EdgeInsets.only(bottom: 80.sp, top: 10.sp),
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
                child: Hero(
                  tag: "image",
                  child: Image.network(
                    article.urlToImage ??
                        'https://via.placeholder.com/150x150.png?text=No+Image',
                    //height: 300.0,
                    //  width: ,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
