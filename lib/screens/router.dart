import 'package:fifth_exam/data/models/notification_model/notification_model.dart';
import 'package:fifth_exam/screens/no_internet/no_internet.dart';
import 'package:fifth_exam/screens/tab_box/d/d_page.dart';
import 'package:fifth_exam/screens/tab_box/d/news_detail.dart';
import 'package:fifth_exam/screens/tab_box/tab_box.dart';
import 'package:flutter/material.dart';

abstract class RoutName {
  static const tabBox = 'tabBox';
  static const notification = 'notification';
  static const noInternetRoute = 'noInternetRoute';
  static const newsDetailRoute = '/news_route';
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutName.noInternetRoute:
        return MaterialPageRoute(
          builder: (_) =>
              NoInternetPage(voidCallback: settings.arguments as VoidCallback),
        );
      case RoutName.tabBox:
        return MaterialPageRoute(builder: (_) => TabBoxPage());
      case RoutName.notification:
        return MaterialPageRoute(builder: (_) => DPage());

      case RoutName.newsDetailRoute:
        return MaterialPageRoute(
            builder: (_) => NewsDetailPage(
                  notificationModel: settings.arguments as NotificationModel,
                ));
      // case RoutName.productInfo:
      //   final args = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //     builder: (_) => ProductInfoPage(
      //       productInfo: args['productInfo'],
      //     ),
      //   );

      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
