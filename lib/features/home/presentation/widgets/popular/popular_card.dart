import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_assesment/config/routes/route_contants.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/core/widgets/like_button.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.tourPage);
      },
      child: Stack(
        children: [
          Container(
            width: 212.w,
            height: 280.h,
            decoration: ShapeDecoration(
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    "https://images.unsplash.com/photo-1711100360031-24aaccbcd408?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Positioned(top: 16.h, right: 16.w, child: const LikeButton()),
          Positioned(
            bottom: 28.h,
            left: 24.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 120, maxHeight: 40),
                  child: Text(
                    'Monument to Salavat Yula',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          height: 0,
                          color: AppColors.primaryColor,
                        ),
                  ),
                ),
                SpacingUtil.verticalSpacing(8.h),
                Container(
                    width: 53.w,
                    height: 23.h,
                    decoration: ShapeDecoration(
                      color: AppColors.primaryColor
                          .withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SVGUtils.svgFromAsset(Assets.icons.rate),
                          SpacingUtil.horizontalSpacing(4.w),
                          Text(
                            '4,9',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12.sp,
                                  color:
                                      AppColors.primaryColor.withOpacity(0.65),
                                ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
