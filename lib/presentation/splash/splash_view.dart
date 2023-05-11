import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutapp/app/app_prefs.dart';
import 'package:tutapp/app/di.dart';
import 'package:tutapp/presentation/resources/assets_manager.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/constants_manager.dart';
import 'package:tutapp/presentation/resources/routs_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
      if (isUserLoggedIn) {
        return Navigator.pushReplacementNamed(context, Routes.mainRoute);
      } else {
        _appPreferences
            .isOnBoardingScreenViewed()
            .then((isOnBoardingScreenViewed) {
          if (isOnBoardingScreenViewed) {
            return Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashLogo),
      ),
    );
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
