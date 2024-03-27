import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/config/routes/route_contants.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/spacing.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_assesment/core/widgets/like_button.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<PopularModel> _test = [
  PopularModel(
      id: 1,
      isFavorite: false,
      title: 'Eiffel Tower',
      rating: 4.9,
      image:
          'https://lh3.googleusercontent.com/p/AF1QipPTxHG0_dJooayYKzCB004tccRM5MhxYp6KWa53=s1360-w1360-h1020'),
];

class PopularCard extends StatelessWidget {
  final PopularEntity popular;
  const PopularCard({super.key, required this.popular});

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
              image: DecorationImage(
                image: CachedNetworkImageProvider(popular.image),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
          Positioned(
              top: 16.h,
              right: 16.w,
              child: ValueListenableBuilder(
                valueListenable: Hive.box(HiveService.favorite).listenable(),
                builder: (context, box, child) => InkWell(
                  onTap: () {
                    box.values.forEach((element) {
                      print(element);
                    });
                    if (box.containsKey(popular.id)) {
                      box.delete(popular.id);
                    } else {
                      box.put(popular.id, popular);
                    }
                  },
                  child: LikeButton(
                    isFav: box.containsKey(popular.id),
                  ),
                ),
              )),
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
                    popular.title,
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
                            popular.rating.toString(),
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
