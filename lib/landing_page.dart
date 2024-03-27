import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter_assesment/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_assesment/features/saved/saved_screen.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  // initial index will be 0, which means first screen is selected
  final _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    /// pages for each index is defined here, you can replace it with your own pages
    /// pages should be the same length as the number of items in the bottom navigation bar
    /// if that is not the case the pages will not be rendered in the UI
    final pages = [
      const HomeScreen(),
      SavedScreen(),
      Center(child: InkWell(onTap: () {}, child: Text("Chat Screen"))),
      const Center(child: Text("Settings Screen")),
    ];
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, value, child) => Scaffold(
        body: pages[_currentIndex.value], // show the page for the current index
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, value, child) => CustomBottomNavigationBar(
            currentIndex: _currentIndex.value,
            onTap: (value) {
              _currentIndex.value = value;
            },
            items: [
              CustomBottomNavigationItem(icon: Assets.icons.main),
              CustomBottomNavigationItem(icon: Assets.icons.liked),
              CustomBottomNavigationItem(icon: Assets.icons.chat),
              CustomBottomNavigationItem(icon: Assets.icons.settings),
            ],
          ),
        ),
      ),
    );
  }
}
