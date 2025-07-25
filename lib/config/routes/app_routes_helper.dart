import 'package:flutter/material.dart';
import 'package:abs/config/extensions/extensions.dart';

Map<String, dynamic>? getArguments(BuildContext context) => (ModalRoute.of(context))!.settings.arguments as Map<String, dynamic>?;

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

get getContext => navigatorKey.currentState?.context;
NavigatorState? get getCurrentState => navigatorKey.currentState;

// static AppLocalizations get lan => Localizations.of<AppLocalizations>(getContext, AppLocalizations)!;

/// if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
// get getContext => navigatorKey.currentContext;

/// Dispose current screens or close current dialog

Future<T?> pushRoute<T>(
  String route, {
  bool isNewTask = false,
  bool isToReplace = false,
  String? exceptRoute,
  Map<String, dynamic>? arguments,
}) async {
  if (isNewTask) {
    /*(route) => route.isCurrent && route.settings.name == "newRouteName"
        ? false
        : true)*/
    return Navigator.pushNamedAndRemoveUntil<T>(
        getContext, route, exceptRoute.isNotNull ? ModalRoute.withName(exceptRoute!) : (route) => false,
        arguments: arguments);
  } else if (isToReplace) {
    return Navigator.pushReplacementNamed(getContext, route, arguments: arguments);
  } else {
    return Navigator.pushNamed<T>(getContext, route, arguments: arguments);
  }
}

/// Dispose current screens or close current dialog
void pop<T>([T? object]) {
  if (Navigator.canPop(getContext)) Navigator.pop<T>(getContext, object);
}

/// Dispose current screen or close current dialog
push({required BuildContext context, required String route, Map<String, dynamic>? argument}) =>
    Navigator.pushNamed(context, route, arguments: argument);
Future<T?> pushScreen<T>({required BuildContext context, required Widget screen, Map<String, dynamic>? argument}) =>
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
pushAndRemove({required BuildContext context, required String route}) => Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (route) => false,
    );
String? get getCurrentRouteName => ModalRoute.of(getContext)?.settings.name;
