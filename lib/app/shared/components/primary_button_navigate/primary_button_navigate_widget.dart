import 'package:devnology/app/shared/components/primary_button_navigate/constants.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButtonNavigateWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function()? onPressed;
  const PrimaryButtonNavigateWidget({Key? key,  this.onPressed, required this.label, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(ThemeColors.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      PrimaryButtonDimens.radiusBorderButton),
                  side: BorderSide(color: ThemeColors.primary)))),
      child: Container(
        margin: EdgeInsets.all(PrimaryButtonDimens.marginContentButton),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Icon(
              icon,
              color: Colors.white,
              size: PrimaryButtonDimens.sizeIconInButton,
            )
          ],
        ),
      ),
    );
  }
}
