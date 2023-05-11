import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

Widget loading() {
  return Shimmer(
    gradient: LinearGradient(
      colors: [
        AppColors.grey400,
        AppColors.grey600,
        AppColors.grey600,
      ],
     // begin: const Alignment(-1.0, -0.5),
     // end: const Alignment(1.0, 0.5),
      //stops: const [0.0, 0.5, 1.0],
    ),
    child: Stack(
      children: [
        Positioned(
          bottom: 10.0,
          child: Container(
            padding: const EdgeInsets.all(10),
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
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
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
                  color: Colors.grey.withOpacity(0.9),
                  offset: const Offset(0, 10),
                ),
              ],
            ),

          ),
        ),
      ],
    ),
  );
}
