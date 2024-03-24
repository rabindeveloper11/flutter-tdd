import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/features/tour/presentation/widgets/tour_feature.dart';
import 'package:flutter_assesment/features/tour/presentation/widgets/tour_image_card.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TourPage extends StatelessWidget {
  const TourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 300),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Hero(tag: 'popular_card', child: TourImageCard()),
                  SpacingUtil.verticalSpacing(28),
                  const Text(
                    'Shulgaт-Tash cave ',
                    style: TextStyle(
                      color: Color(0xFF242424),
                      fontSize: 28,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SpacingUtil.verticalSpacing(12.h),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 290.w,
                    ),
                    child: Text(
                      'A truly amazing example of the creation of nature, the Kapova cave with cave paintings of ancient people with...',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            height: 1.3,
                            color: AppColors.bodyTextColor,
                          ),
                    ),
                  ),
                  SpacingUtil.verticalSpacing(8.h),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 20.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Read more',
                          style: TextStyle(
                            color: AppColors.buttonColor,
                            fontSize: 15,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                        SpacingUtil.horizontalSpacing(10.w),
                        SVGUtils.svgFromAsset(Assets.icons.more),
                      ],
                    ),
                  ),
                  SpacingUtil.verticalSpacing(24.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => const Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: TourFeature(),
                        ),
                      ),
                    ),
                  ),
                  SpacingUtil.verticalSpacing(22.h),
                  Center(
                    child: Container(
                      width: 327,
                      height: 64,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF678B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Buy a tour ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w500,
                              height: 0.08,
                            ),
                          ),
                          SpacingUtil.horizontalSpacing(12.w),
                          SVGUtils.svgFromAsset(Assets.icons.arrowRight),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
