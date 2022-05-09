import 'package:devnology/app/shared/components/app_bar_logo/app_bar_logo.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class OrderPlacedAppBarWidget extends StatelessWidget with PreferredSizeWidget{
  const OrderPlacedAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.primary,
      centerTitle: false,
      elevation: 0,
      title: AppBarLogo(),
    );
  }

}
