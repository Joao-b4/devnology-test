import 'package:devnology/app/shared/components/white_button_navigate/constants.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteButtonNavigateWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onPressed;
  const WhiteButtonNavigateWidget({Key? key, required this.onPressed, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      WhiteButtonDimens.radiusBorderButton),
                  side: BorderSide(color: Colors.white)))),
      child: Container(
        margin: EdgeInsets.all(WhiteButtonDimens.marginContentButton),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              label,
              style: TextStyle(color: ThemeColors.primary, fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              color: ThemeColors.primary,
              size: WhiteButtonDimens.sizeIconInButton,
            )
          ],
        ),
      ),
    );
  }
}
