
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';

import '../constants/colors.dart';

class NewsDetails extends StatelessWidget {
  final Article article;

  NewsDetails({Key? key, required this.article}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  handTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      "/fullArticle",
      arguments: article.url ?? "",
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: navigatorKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.only(top: 70, left: 5, right: 5),
                width: MediaQuery.of(context).size.width,
                height: size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.black,
                      Colors.black.withOpacity(0.7),
                    ],
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                  ),
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/fullArticle",
                              arguments: article.url ?? "");
                        },
                        child: Chip(
                          label: Text(article.source.name ?? "UNKNOWN SOURCE"),
                        ),
                      ),
                      Text(
                        article.title ?? '',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 18.0,
                          ),
                          children: [
                            TextSpan(
                              text: article.description ?? '',
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => handTap(context),
                              text: 'more',
                              style: const TextStyle(
                                  color: AppColors.blue, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: size.height * 0.5,
              margin: const EdgeInsets.only(
                  bottom: 80, top: 10, left: 30, right: 30),
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
                  child: GestureDetector(
                    onVerticalDragEnd: (drag) {
                      Navigator.pop(context);
                    },
                    child: Image.network(
                      article.urlToImage ??
                          'https://via.placeholder.com/150x150.png?text=No+Image',
                      height: 300.0,
                      width: 300,
                      fit: BoxFit.cover,
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
