import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.h,
      decoration: ShapeDecoration(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.favorite,
          color: AppColors.selectedIconColor,
          size: 18,
        ),
      ),
    );
  }
}
