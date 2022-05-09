import 'package:devnology/app/modules/products/presenter/components/product_app_bar/constants.dart';
import 'package:devnology/app/shared/components/app_bar_logo/app_bar_logo.dart';
import 'package:devnology/app/shared/components/cart_icon/cart_icon_widget.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final int countCartItems;
  const ProductAppBarWidget({Key? key, this.countCartItems = 0})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.primary,
      centerTitle: true,
      elevation: 0,
      title: AppBarLogo(),
      actions: [
        Center(
          child: IconButton(
              icon: CartIconWidget(
                  countItems: countCartItems,
                  color: ProductAppBarThemeColors.iconAction,
                  size: ProductAppBarDimens.sizeCartIcon),
              onPressed: () {
                Modular.to.navigate("/cart");
              }),
        )
      ],
    );
  }
}
