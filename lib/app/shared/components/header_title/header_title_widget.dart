import 'package:devnology/app/shared/components/header_title/constants.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  final String title;
  const HeaderTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: ThemeColors.primary,
          fontSize: HeaderTitleDimins.fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
