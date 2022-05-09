import 'package:devnology/app/shared/components/app_bar_logo/constants.dart';
import 'package:flutter/material.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      width: AppBarLogoDimins.logoWidth,
    );
  }
}
