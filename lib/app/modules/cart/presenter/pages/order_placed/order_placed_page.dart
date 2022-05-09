import 'package:devnology/app/modules/cart/presenter/pages/order_placed/components/order_placed_app_bar/order_placed_app_bar_widget.dart';
import 'package:devnology/app/modules/cart/presenter/pages/order_placed/constants/colors.dart';
import 'package:devnology/app/modules/cart/presenter/pages/order_placed/constants/dimens.dart';
import 'package:devnology/app/shared/components/header_title/header_title_widget.dart';
import 'package:devnology/app/shared/components/primary_button_navigate/primary_button_navigate_widget.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatefulWidget {
  final String title;
  const OrderPlacedPage({Key? key, this.title = 'OrderPlacedPage'})
      : super(key: key);
  @override
  OrderPlacedPageState createState() => OrderPlacedPageState();
}

class OrderPlacedPageState extends State<OrderPlacedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
          backgroundColor: OrderPlacedThemeColors.background,
          appBar: OrderPlacedAppBarWidget(),
          body: Padding(
            padding: EdgeInsets.only(
                left: OrderPlacedDimens.marginLeftScreen,
                right: OrderPlacedDimens.marginRightScreen),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: ThemeColors.primary),
                    width: OrderPlacedDimens.widthBoxIconCheck,
                    height: OrderPlacedDimens.heightBoxIconCheck,
                    child: Icon(
                      Icons.check,
                      color: ThemeColors.selected,
                      size: OrderPlacedDimens.sizeIconCheck,
                    ),
                  ),
                  SizedBox(height: OrderPlacedDimens.marginTopTitle),
                  HeaderTitleWidget(title: "Order Placed!"),
                  SizedBox(height: OrderPlacedDimens.marginTopDescription),
                  Text(
                    "Your order was placed successfully. For more details, check All My Orders page under Profile tab",
                    style:
                        TextStyle(fontSize: OrderPlacedDimens.fontSizeDescription, color: ThemeColors.primary),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: OrderPlacedDimens.marginTopButtonOrders),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: PrimaryButtonNavigateWidget(
                            onPressed: () => null,
                            label: "MY ORDERS",
                            icon: Icons.keyboard_arrow_right),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
