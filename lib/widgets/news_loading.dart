import 'package:flutter/material.dart';

import '../../widgets/shimmer_box.dart';
class NewsLoading extends StatelessWidget {
  const NewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, int index) {
            return loading();
          }),
    );
  }
}