import 'package:devnology/app/modules/cart/presenter/pages/cart/cart_controller.dart';
import 'package:devnology/app/modules/cart/presenter/pages/cart/components/cart_bottom_app_bar/cart_bottom_app_bar_widget.dart';
import 'package:devnology/app/modules/cart/presenter/pages/cart/components/cart_items/cart_items_widget.dart';
import 'package:devnology/app/modules/cart/presenter/pages/cart/constants/colors.dart';
import 'package:devnology/app/modules/cart/presenter/pages/cart/constants/dimens.dart';
import 'package:devnology/app/shared/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:devnology/app/shared/components/default_app_bar/default_app_bar_widget.dart';
import 'package:devnology/app/shared/components/header_title/header_title_widget.dart';
import 'package:devnology/app/shared/helpers/convert_double_to_currency.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key? key, this.title = 'CartPage'}) : super(key: key);
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends ModularState<CartPage, CartController> {
  @override
  void initState() {
    controller.getCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
          backgroundColor: CartThemeColors.background,
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CartBottomAppBarWidget(
                  onPressedCheckout: controller.countCartItems != 0
                      ? () => Modular.to.pushNamed("/cart/orderplaced")
                      : null,
                  totalPrice: convertDoubleToCurrency(controller.totalPrice)),
              BottomNavigationBarWidget(
                  countCartItems: controller.countCartItems, currentIndex: 2),
            ],
          ),
          appBar: DefaultAppBarWidget(),
          body: Padding(
            padding: EdgeInsets.only(
                left: CartDimens.marginLeftScreen,
                right: CartDimens.marginRightScreen),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: CartDimens.marginTopCartTitle),
                HeaderTitleWidget(title: "Cart"),
                SizedBox(height: CartDimens.marginTopCartItems),
                Expanded(
                  child: CartItemsWidget(
                    cartItems: controller.cartItems,
                    onAddQuantity: controller.addQuantityProduct,
                    onRemoveQuantity: controller.removeQuantityProduct,
                  ),
                )
                // ProductsWidget()
              ],
            ),
          )),
    );
  }
}
