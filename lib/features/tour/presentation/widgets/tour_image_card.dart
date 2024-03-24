import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/core/widgets/like_button.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourImageCard extends StatelessWidget {
  const TourImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 343.w,
          height: 397.h,
          decoration: ShapeDecoration(
            image: const DecorationImage(
              image: CachedNetworkImageProvider(
                  "https://images.unsplash.com/photo-1707327259268-2741b50ef5e5?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Colors.black.withOpacity(0.03999999910593033),
              ),
              borderRadius: BorderRadius.circular(34),
            ),
          ),
        ),
        Positioned(
          top: 24,
          left: 24,
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SVGUtils.svgFromAsset(Assets.icons.back)),
        ),
        const Positioned(bottom: -10, right: 28, child: LikeButton()),
        Positioned(
          bottom: 24.h,
          left: 24.w,
          child: Container(
            width: 170.w,
            height: 44.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.10000000149011612),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1707327259268-2741b50ef5e5?q=80&w=2875&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                    ),
                    SpacingUtil.horizontalSpacing(8.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Azat Khabirov",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1,
                                  ),
                        ),
                        SpacingUtil.verticalSpacing(3.h),
                        Text(
                          "John Doe",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.textFieldIconColor,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
