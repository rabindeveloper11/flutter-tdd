import 'package:flutter/material.dart';
import 'package:flutter_assesment/config/routes/route_contants.dart';
import 'package:flutter_assesment/features/home/presentation/pages/search_results.dart';
import 'package:flutter_assesment/features/tour/presentation/pages/tour_page.dart';
import 'package:flutter_assesment/landing_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
// ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case RouteConstants.tourPage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return const TourPage();
        });

      case RouteConstants.landingPage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return LandingPage();
        });

      case RouteConstants.searchResultsPage:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          return const SearchResults();
        });

      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}
