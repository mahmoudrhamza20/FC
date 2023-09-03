import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class MagicRouter {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Future<dynamic> navigateTo(Widget page, {Object? object}) =>
      navigatorKey.currentState!.push(_materialPageRoute(page, object: object));

  static Future<dynamic> navigateAndPopAll(Widget page, {Object? object}) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page, object: object),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page,
          {Object? object}) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _materialPageRoute(page, object: object), (route) => route.isFirst);

  static void pop() => navigatorKey.currentState!.pop();

  static Route<dynamic> _materialPageRoute(Widget page, {Object? object}) =>
      MaterialPageRoute(
          builder: (_) => page, settings: RouteSettings(arguments: object));
}
