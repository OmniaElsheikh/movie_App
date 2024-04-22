import 'package:flutter/material.dart';
import 'package:movies_app/core/config/routes/pages_route_name.dart';
import 'package:movies_app/ui/layout_view/views/layout_view.dart';
import 'package:movies_app/ui/splash/views/splash_views.dart';

class Routes {
  static Route<dynamic> onGeneratedRouteSettings(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case PagesRouteName.layoutView:
        return MaterialPageRoute(
            builder: (context) => const LayoutView(), settings: settings);
      // case PagesRouteName.browesView:
      //   return MaterialPageRoute(
      //       builder: (context) => const BrowesView(), settings: settings);

      default:
        return MaterialPageRoute(builder: (context) => const LayoutView());
    }
  }
}
