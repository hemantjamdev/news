import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticle extends StatefulWidget {
  final String url;

  const FullArticle({Key? key, required this.url}) : super(key: key);

  @override
  State<FullArticle> createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  late WebViewController controller;

  @override
  void initState() {
    controller = WebViewController()
      ..loadRequest(Uri.parse(widget.url))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(child: WebViewWidget(controller: controller))),
    );
  }
}
