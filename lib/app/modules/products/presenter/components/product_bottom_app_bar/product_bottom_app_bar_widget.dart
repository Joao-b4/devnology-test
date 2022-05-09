import 'package:devnology/app/modules/products/presenter/components/product_bottom_app_bar/constants.dart';
import 'package:devnology/app/shared/components/primary_button_navigate/primary_button_navigate_widget.dart';
import 'package:devnology/app/shared/components/white_button_navigate/white_button_navigate_widget.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductBottomAppBarWidget extends StatelessWidget {
  final Function onPressedShare;
  final Function onPressedAddToCart;
  const ProductBottomAppBarWidget(
      {Key? key,
      required this.onPressedShare,
      required this.onPressedAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ThemeColors.secondary,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ProductBottomAppBarDimens.marginVerticalButtons),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            WhiteButtonNavigateWidget(onPressed: () => onPressedShare(), label: "SHARE THIS",icon: Icons.keyboard_arrow_up,),
            PrimaryButtonNavigateWidget(onPressed: () => onPressedAddToCart(), label: "ADD TO CART",icon: Icons.keyboard_arrow_right,),
          ],
        ),
      ),
    );
  }
}
