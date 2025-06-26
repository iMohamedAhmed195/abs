import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:abs/config/constants/app_prefs.dart';
import 'package:abs/core/utils/theme/app_theme.dart';
import 'package:abs/core/utils/theme/theme_cubit.dart';
import 'exports.dart';

class AbsApp extends StatefulWidget {
  const AbsApp({super.key});

  @override
  State<AbsApp> createState() => _AbsAppState();
}
class _AbsAppState extends State<AbsApp> {
  bool isDark = false;


  @override
  void initState() {

    super.initState();

  }



  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));
    return MultiBlocProvider(
      providers: BlocProviders.providers,
      child: _buildApp(context),
    );
  }

  Widget _buildApp(BuildContext context) {

    return GestureDetector(
      onTap: hideKeyboard, // call the function
      child: MaterialApp(
        themeMode:  ThemeMode.light,
        theme: AppTheme.lightTheme,
        locale: context.locale,
        title: AppStrings.appName.trans,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.last;
        },
        navigatorKey: navigatorKey,
        color: AppColors.primaryColor,
         onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }

  TextDirection _getTextDirection(Locale locale) {
    const rtlLanguages = ['ar', 'he', 'fa', 'ur'];
    return rtlLanguages.contains(locale.languageCode)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }
}
