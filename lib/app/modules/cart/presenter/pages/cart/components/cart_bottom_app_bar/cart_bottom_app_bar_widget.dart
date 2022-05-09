import 'package:devnology/app/modules/cart/presenter/pages/cart/components/cart_bottom_app_bar/constants.dart';
import 'package:devnology/app/shared/components/primary_button_navigate/primary_button_navigate_widget.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartBottomAppBarWidget extends StatelessWidget {
  final void Function()? onPressedCheckout;
  final String totalPrice;
  const CartBottomAppBarWidget(
      {Key? key,
       this.onPressedCheckout, required this.totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.secondary,
      padding: EdgeInsets.symmetric(
          vertical: CartBottomAppBarDimens.marginVerticalButtons),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Total", style: TextStyle(color: Colors.white, fontSize: CartBottomAppBarDimens.fontSizeTotalText),),
                Text(totalPrice, style: TextStyle(color: Colors.white, fontSize: CartBottomAppBarDimens.fontSizeTotal, fontWeight: FontWeight.bold))
              ]
          ),
          PrimaryButtonNavigateWidget(onPressed: onPressedCheckout, label: "CHECKOUT", icon: Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}
