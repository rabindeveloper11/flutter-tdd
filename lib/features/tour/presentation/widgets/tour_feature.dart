import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourFeature extends StatelessWidget {
  const TourFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      padding: EdgeInsets.only(
        top: 16.h,
        left: 22.w,
        right: 22.h,
        bottom: 14.w,
      ),
      decoration: ShapeDecoration(
        color: AppColors.cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SVGUtils.svgFromAsset(Assets.icons.price),
          SpacingUtil.verticalSpacing(12.h),
          Text(
            "from 90 \$",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
