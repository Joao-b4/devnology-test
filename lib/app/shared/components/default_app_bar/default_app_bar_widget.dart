import 'package:devnology/app/shared/components/app_bar_logo/app_bar_logo.dart';
import 'package:devnology/app/shared/components/default_app_bar/constants.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultAppBarWidget extends StatelessWidget with PreferredSizeWidget{
  const DefaultAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.primary,
      centerTitle: false,
      elevation: 0,
      title: AppBarLogo(),
      actions: [
        _buildIconButton(Icons.chat_bubble_outline_rounded, (){}),
        _buildIconButton(Icons.notifications_none_outlined, (){}),
      ],
    );
  }

  IconButton _buildIconButton(IconData icon, Function onPressed) => IconButton(icon: Icon(icon),color: DefaultAppBarThemeColors.iconAction, onPressed: (){
    onPressed();
  });

}
