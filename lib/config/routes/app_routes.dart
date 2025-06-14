import 'package:nested/nested.dart';
import 'package:new_ilearn/features/auth/presentation/screens/enter_otp_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/login_screen.dart';
import 'package:new_ilearn/features/auth/presentation/screens/new_password_page.dart';
import 'package:new_ilearn/features/auth/presentation/screens/register_screen.dart';
import 'package:new_ilearn/features/books/presentation/managers/add_books_cubit.dart';
import 'package:new_ilearn/features/books/presentation/managers/get_books_cubit.dart';
import 'package:new_ilearn/features/books/presentation/screens/book_screen.dart';
import 'package:new_ilearn/features/books/presentation/screens/open_pdf_file.dart';
import 'package:new_ilearn/features/bottom_navigation/presentation/screens/bottom_navigation_screen.dart';

import 'package:new_ilearn/features/notification/presentation/notification_screen.dart';
import 'package:new_ilearn/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:new_ilearn/features/profile/presentation/screens/profile_screen.dart';
import 'package:new_ilearn/features/profile/presentation/managers/update_profile_cubit.dart';
import 'package:new_ilearn/features/settings/presentation/screens/setting_screen.dart';
import 'package:new_ilearn/features/splash_screen/presentation/screens/splash_screen.dart';
import 'package:new_ilearn/features/splash_screen/presentation/screens/start_screen.dart';
import 'package:new_ilearn/features/tearmes_and_condetions/presentation/aboutApp_page.dart';
import 'package:new_ilearn/features/tearmes_and_condetions/presentation/privacyPolicyPage.dart';
import 'package:new_ilearn/features/tearmes_and_condetions/presentation/serviceTerms_page.dart';
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
        return buildPageRoute<T>(
          child: RegisterScreen(),
          routeSettings: routeSettings,
          providers: [BlocProvider<ErrorCubit>(create: (context) => ErrorCubit())],
        );

      case Routes.bottomNavigationRoute:
        return buildPageRoute<T>(providers: [], child: BottomNavigationScreens(), routeSettings: routeSettings);
      case Routes.bookRoute:
        return buildPageRoute<T>(
          child: BookScreen(
            idFolder: (routeSettings.arguments as Map<String, dynamic>)["idFolder"],
            titleHeader: (routeSettings.arguments as Map<String, dynamic>)["titleHeader"],
            isArchive: (routeSettings.arguments as Map<String, dynamic>)["isArchive"],
          ),
          routeSettings: routeSettings,
          providers: [
            BlocProvider<GetBooksCubit>(
              create:
                  (context) =>
                      GetBooksCubit(useCase: ServiceLocator.instance.getIt())
                        ..getBooks(categoryId: (routeSettings.arguments as Map<String, dynamic>)["idFolder"]),
            ),
          ],
        );
      case Routes.notificationRoute:
        return buildPageRoute<T>(child: NotificationScreen(), routeSettings: routeSettings);
      case Routes.forgetPasswordRoute:
        return buildPageRoute<T>(child: ForgetPasswordScreen(), routeSettings: routeSettings);
      case Routes.newPasswordRoute:
        return buildPageRoute<T>(
          child: NewPasswordScreen(email: (routeSettings.arguments as Map<String, dynamic>)["email"]),
          routeSettings: routeSettings,
        );
      case Routes.enterOtpRoute:
        return buildPageRoute<T>(
          child: EnterOtpScreen(
            isFromForgetPassword: (routeSettings.arguments as Map<String, dynamic>)["isFromForgetPassword"],
            email: (routeSettings.arguments as Map<String, dynamic>)["email"],
          ),
          routeSettings: routeSettings,
          providers: [BlocProvider<ErrorCubit>(create: (context) => ErrorCubit())],
        );
      case Routes.profileScreen:
        return buildPageRoute<T>(providers: [
            BlocProvider(create: (context) => UpdateProfileCubit(cache : ServiceLocator.instance.getIt(),useCase: ServiceLocator.instance.getIt()),),
        ],
          child: ProfileScreen(),
          routeSettings: routeSettings,
        );
      case Routes.settingScreen:
        return buildPageRoute<T>(child: SettingScreen(), routeSettings: routeSettings);
      case Routes.termsOfServiceScreen:
        return buildPageRoute<T>(child: TermsOfServiceScreen(), routeSettings: routeSettings);
      case Routes.aboutAppScreen:
        return buildPageRoute<T>(child: AboutAppScreen(), routeSettings: routeSettings);

      case Routes.privacyPolicyScreen:
        return buildPageRoute<T>(child: PrivacyPolicyScreen(), routeSettings: routeSettings);
      case Routes.openFilePdfRoute:
        return buildPageRoute<T>(
          child: OpenFilePdfPage(
            nameFile: (routeSettings.arguments as Map<String, dynamic>)["nameFile"],
            path: (routeSettings.arguments as Map<String, dynamic>)["path"],
          ),
          routeSettings: routeSettings,
        );

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
