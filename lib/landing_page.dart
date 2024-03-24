import 'package:flutter/material.dart';
import 'package:flutter_assesment/core/widgets/bottom_navigation_bar.dart';
import 'package:flutter_assesment/features/home/presentation/pages/home_screen.dart';
import 'package:flutter_assesment/gen/assets.gen.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});
  // initial index will be 0, which means first screen is selected
  final _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final _pages = [
      HomeScreen(),
      Container(color: Colors.red),
      Container(color: Colors.green),
      Container(color: Colors.blue),
    ];
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (context, value, child) => Scaffold(
        body: _pages[_currentIndex.value],
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
