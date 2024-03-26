import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/theme/app_theme.dart';
import 'package:flutter_assesment/core/utils/svg_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationItem {
  final String icon;
  const CustomBottomNavigationItem({required this.icon});
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<CustomBottomNavigationItem> items;
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : assert(currentIndex < items.length, 'Current Index out of range');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 100,
      decoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            items.length,
            (index) {
              final currentItem = items[index];
              return InkWell(
                onTap: () {
                  onTap(index);
                },
                child: Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: ShapeDecoration(
                    shape: const OvalBorder(),
                    color: index == currentIndex ? AppColors.buttonColor : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SVGUtils.svgFromAsset(
                      currentItem.icon,
                      color: currentIndex == index
                          ? AppColors.primaryColor
                          : AppColors.unselectedIconColor,
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
