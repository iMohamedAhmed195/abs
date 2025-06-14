import 'dart:async';
import 'package:lottie/lottie.dart';
import 'package:new_ilearn/config/constants/app_prefs.dart';
import 'package:new_ilearn/features/splash_screen/presentation/manager/get_configration_cubit.dart';

import '../../../../exports.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  // Counter to track timer ticks
  int counter = 0;

  // Stores the route name for navigation after the splash screen
  String? route;

  Timer? timer;
  // Animation controller
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  // bool? isNotificationEnabled;


  @override
  void initState() {
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Fade animation from 0 to 1
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Scale animation from 0.5 to 1.0
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ),
    );

    // Start the animation
    _animationController.forward();
    nextScreen();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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
      print("the token is" + AppPrefs.token.toString());

       route = AppPrefs.token.isNotNull ? Routes.bottomNavigationRoute : Routes.onBoardingRoute;
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
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: SizedBox(
                          width: 180.w,
                          height: 200.h,
                          child: Image.asset(AppAssets.logoWhite),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
        );
      },
    );
  }
}
