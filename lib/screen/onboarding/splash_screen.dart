import 'dart:async';

import 'package:blott/api/config.dart';
import 'package:blott/screen/dashboard/dashboard.dart';
import 'package:blott/screen/onboarding/sign_up.dart';
import 'package:blott/utils/constants.dart';
import 'package:blott/utils/dimension.dart';
import 'package:blott/utils/injector.dart';
import 'package:blott/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'signup_complete.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({super.key});
  static const String id = 'splash.screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  void screeenToDisplay() async {
    bool result = await checkIfIsFirstLaunch();

    String notificationStatusData = await injector.localStorage.returnString(
      key: kNotificationStatus,
    );

    if (result == true) {
      if (context.mounted) {
        RouteNavigators.routeReplace(
          context,
          const SignUpScreen(),
        );
      }
    } else {
      if (notificationStatusData == 'allowed') {
        RouteNavigators.routeReplace(
          context,
          const DashboardScreen(),
        );
      } else {
        RouteNavigators.routeReplace(
          context,
          const SignUpComplete(),
        );
      }
    }
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 3),
      () {
        screeenToDisplay();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: getScreenHeight(150),
          width: getScreenWidth(150),
          child: ScaleTransition(
            scale: animation,
            child: Image.asset(
              'assets/images/LogoBlott.png',
              height: getScreenHeight(188),
              width: getScreenWidth(188),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
