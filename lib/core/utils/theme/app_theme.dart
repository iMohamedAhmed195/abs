import '../../../exports.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(useMaterial3:   true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.primaryColor,
      textTheme:  TextTheme(
          labelSmall: getRegularTextStyle(color: AppColors.primaryColor),

          titleLarge:   getMediumTextStyle(color: Colors.black),
          titleMedium:   getMediumTextStyle(color: Colors.black38),
          titleSmall:   getRegularTextStyle(color: Colors.black12),),
      cardColor: AppColors.lightSplashColor,
      bottomAppBarTheme:
      BottomAppBarTheme(color: AppColors.colorNavigationGray

        //colorNavigationGray
      ),
      splashColor: Colors.white,
      indicatorColor: Colors.black26,
      highlightColor: Colors.black45,
      secondaryHeaderColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.primaryColor,size: 10),
      appBarTheme: const AppBarTheme(color: Colors.white));


  static ThemeData darkTheme = ThemeData(useMaterial3:   true,
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: AppColors.primaryColor,
      textTheme:
      TextTheme(
          labelSmall: getRegularTextStyle(color: AppColors.white,fontSize: 8),
          titleLarge: getMediumTextStyle(color: AppColors.white),
          titleMedium: getMediumTextStyle(color: Colors.white70),
          titleSmall: getRegularTextStyle(color: Colors.white60,fontSize: 8)),
      cardColor: const Color(0xff3f3f3f                         ),
      bottomAppBarTheme:
      const BottomAppBarTheme(color: Color(0xff353435) //colorNavigationGray
      ),
      indicatorColor: Colors.white60,
      primaryColorLight: const Color(0xff3f3f3f),
      splashColor: const Color(0xff3f3f3f),
      highlightColor: Colors.white,
      secondaryHeaderColor: const Color(0xff8b8b8b),
      iconTheme:  const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(color: Color(0xff353435)));
}