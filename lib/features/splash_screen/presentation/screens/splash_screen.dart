import 'dart:async';
import 'package:abs/config/constants/app_prefs.dart';

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
       route =  Routes.bottomNavigationRoute ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomBackground(
        showSafeArea: false,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.white
          ),
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
                      child: Image.asset(AppAssets.logo),
                    ),
                  ),
                );
              },
            ),
          ),
        )
    );
  }
}
