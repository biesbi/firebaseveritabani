import 'package:flutter_samet_aydin/pages/auth2/home_page.dart';

import 'pages/auth2/home_page.dart';
import 'package:flutter/cupertino.dart';

abstract class AppRoutes {
  static const home = "/";
  static const status = "/status";
  static const users = "/users";
  static const realtime = "/realtime";

  static const intial = AppRoutes.home;

  static Map<String, Widget Function(BuildContext)> getRoutes(
      BuildContext context) {
    return {
      AppRoutes.home: (context) => HomePage(),
    };
  }
}
