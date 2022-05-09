import 'package:devnology/app/modules/splash/presenter/constants/dimens.dart';
import 'package:devnology/app/modules/splash/presenter/splash_controller.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ModularState<SplashPage, SplashController> {
  @override
  void initState() {
    super.initState();
    this.controller.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeColors.primary,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SplashDimens.marginHorizontalLogo),
            child: Image.asset(
              'assets/images/logo.png',
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              alignment: Alignment.center,
            ),
          ),
        )
      ),
    );
  }
}