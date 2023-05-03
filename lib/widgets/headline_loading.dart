import 'package:flutter/material.dart';
import 'package:news/widgets/shimmer_box.dart';

headLineLoading() {
  return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, int index) {
        return loading(300,500);
      });
}
