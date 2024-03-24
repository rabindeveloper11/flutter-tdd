import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeading extends StatelessWidget {
  final String title; 
  const SectionHeading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
     title,
      style:
          Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 18.sp),
    );
  }
}
