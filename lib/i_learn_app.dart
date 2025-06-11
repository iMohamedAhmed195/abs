import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/core/utils/theme/app_theme.dart';
import 'package:new_ilearn/core/utils/theme/theme_cubit.dart';
import 'exports.dart';

class ILearnApp extends StatefulWidget {
  const ILearnApp({super.key});

  @override
  State<ILearnApp> createState() => _ILearnAppState();
}
late ThemeCubit _themeCubit;
class _ILearnAppState extends State<ILearnApp> {
  // late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  // bool _hasInternet = true;
  bool isDark = false;


  @override
  void initState() {

    super.initState();


    // _connectivitySubscription =
    //     Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
    // _checkInitialConnection();
  }

  // Future<void> _checkInitialConnection() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   _updateConnectionStatus([connectivityResult]);
  // }
  //
  // void _updateConnectionStatus(List<ConnectivityResult> result) {
  //   bool isConnected = result.contains(ConnectivityResult.mobile) ||
  //       result.contains(ConnectivityResult.wifi);
  //
  //   if (!isConnected && _hasInternet) {
  //     setState(() {
  //       _hasInternet = false;
  //     });
  //
  //     showBottomSheet(
  //       context: getContext,
  //       builder: (context) => Container(
  //         width: MediaQuery.of(context).size.width,
  //         padding: getPadding(vertical: 50.h, horizontal: 20.w),
  //         child: Text(
  //           AppStrings.noInternetError.trans,
  //           textAlign: TextAlign.center,
  //           style: getSemiBoldTextStyle(fontSize: 20.h),
  //         ),
  //       ),
  //     );
  //   } else if (isConnected && !_hasInternet) {
  //     setState(() {
  //       _hasInternet = true;
  //     });
  //   }
  // }

  @override
  void dispose() {
    // _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
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
        builder: (context, child) {
          return Directionality(
            textDirection: _getTextDirection(context.locale),
            child: DevicePreview.appBuilder(context, child),
          );
        },
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
