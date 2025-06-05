import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:new_ilearn/features/splash_screen/presentation/manager/get_configration_cubit.dart';

import '../../../../exports.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Counter to track timer ticks
  int counter = 0;

  // Stores the route name for navigation after the splash screen
  String? route;

  Timer? timer;
  // bool? isNotificationEnabled;
  nextScreen() {
    timer = Timer.periodic(1.seconds, (timer) {
      counter++;
      if (route.isNotNull && counter >= 5 ) {
        route!.moveToAndRemoveCurrent(); // Navigate and remove splash screen
        timer.cancel();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // bool isNew = await getBlocData<OnboardingManagerCubit>().isNewInstalled();
      // bool isLanguageSaved = await getBlocData<LanguageCubit>().getSavedLanguage();
      // UserData? user = await getBlocData<AuthCubit>().getUser();
      // // bool isNotificationInit = (await NotificationsService().initialize()).orFalse;
      // UserData? user = await getBlocData<AuthCubit>().getUser();
      // ConfigData? configData = await getBlocData<ConfigurationCubit>().getConfig();
      // print(user?.token);
      // print(user?.devToken);
      // print("the token is" + AppPrefs.token.toString());
      route = Routes.onBoardingRoute;
      // print("new install ${isNew}");
      // if (isLanguageSaved.isFalse) {
      //   route = Routes.selectLanguageRoute;
      // }
      // else if (isNew.isTrue) {
      //   await checkNotificationPermissionAndDoOperation(
      //     context,
      //     onSuccess: () {
      //       NotificationsService().showSimpleNotification(
      //         title: 'أهلا بك في ايزي',
      //         description: "نرحب بك في منصة ايزي للقروض",
      //       );
      //     },
      //   );
      //   route = Routes.onBoardingRoute;
      // }
      // else if (user.isNotNull) {
      //     route = Routes.bottomNavigationRoute;
      // }
      // else {
      //   route = Routes.loginRoute;
      // }


    });
  }

  @override
  void initState() {
    nextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfigurationCubit, CubitStates>(
      builder: (BuildContext context, state) {
        return CustomBackground(
            showSafeArea: false,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      end: AlignmentDirectional.topStart,
                      begin: AlignmentDirectional.bottomEnd,
                      colors: [Color(0xff00167D), Color(0xff0075E7)])),
              // child: Center(
              //   child: Image.asset(AppAssets.splashLogo,),
              // ),
            )
        );
      },
    );
  }
}
