import 'package:nested/nested.dart';
import 'package:new_ilearn/features/auth/presentation/screens/enter_otp_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/login_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/new_password_page.dart';
import 'package:new_ilearn/features/auth/presentation/screens/register_screen.dart';
import 'package:new_ilearn/features/books/presentation/screens/book_screen.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/screens/bottom_navigation_screen.dart';
import 'package:new_ilearn/features/folders/presentation/folders_screen.dart';
import 'package:new_ilearn/features/home/presentation/screens/home_screen.dart';
import 'package:new_ilearn/features/notification/presentation/notification_screen.dart';
import 'package:new_ilearn/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:new_ilearn/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:new_ilearn/features/splash_screen/presentation/screens/start_screen.dart';
import '../../exports.dart';

class RouteGenerator {
  AnimationType? pageRouteAnimationGlobal;
  static Duration pageRouteTransitionDurationGlobal = 400.milliseconds;
  static Route<T>? generateRoute<T>(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return buildPageRoute<T>(child: SplashScreen(), routeSettings: routeSettings);
      case Routes.onBoardingRoute:
        return buildPageRoute<T>(child: OnBoardingScreen(), routeSettings: routeSettings);
      case Routes.startScreenRoute:
        return buildPageRoute<T>(child: StartScreen(), routeSettings: routeSettings);
      case Routes.loginRoute:
        return buildPageRoute<T>(child: LoginScreen(), routeSettings: routeSettings);
      case Routes.registerRoute:
        return buildPageRoute<T>(child: RegisterScreen(), routeSettings: routeSettings);
      case Routes.bottomNavigationRoute:
        return buildPageRoute<T>(child: BottomNavigationScreens(), routeSettings: routeSettings);
        case Routes.bookRoute:
        return buildPageRoute<T>(child: BookScreen(), routeSettings: routeSettings);
        case Routes.notificationRoute:
        return buildPageRoute<T>(child: NotificationScreen(), routeSettings: routeSettings);

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(body: Center(child: Text("No route defined for ${routeSettings.name}"))),
        );
    }
  }

  static Route<T> buildPageRoute<T>({
    required Widget child,
    AnimationType? pageRouteAnimation = AnimationType.fade,
    Duration? duration,
    RouteSettings? routeSettings,
    List<SingleChildWidget>? providers,
  }) {
    if (providers.isNotNullOrEmpty) {
      child = MultiBlocProvider(providers: providers!, child: child);
    }
    if (pageRouteAnimation == AnimationType.rotate) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return RotationTransition(child: child, turns: ReverseAnimation(anim));
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.scale) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return ScaleTransition(child: child, scale: anim);
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slide) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            child: child,
            position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(anim),
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    } else if (pageRouteAnimation == AnimationType.slideBottomTop) {
      return PageRouteBuilder<T>(
        settings: routeSettings,
        pageBuilder: (context, a1, a2) => child,
        transitionsBuilder: (c, anim, a2, child) {
          return SlideTransition(
            position: Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(anim),
            child: child,
          );
        },
        transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      );
    }

    return PageRouteBuilder<T>(
      settings: routeSettings,
      transitionDuration: duration ?? pageRouteTransitionDurationGlobal,
      reverseTransitionDuration: const Duration(milliseconds: 50),
      pageBuilder: (context, a1, a2) => child,
      transitionsBuilder: (c, anim, a2, child) {
        return FadeTransition(opacity: anim, child: child);
      },
    );
  }
}
