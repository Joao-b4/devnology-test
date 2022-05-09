import 'package:devnology/app/shared/components/cart_icon/constants.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartIconWidget extends StatefulWidget {
  final int countItems;
  final Color color;
  final double? size;
  const CartIconWidget(
      {Key? key, this.countItems = 0, this.color = Colors.white, this.size})
      : super(key: key);

  @override
  _CartIconWidgetState createState() => _CartIconWidgetState();
}

class _CartIconWidgetState extends State<CartIconWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.shopping_cart_outlined,
          color: widget.color,
          size: widget.size,
        ),
        widget.countItems == 0
            ? Padding(padding: EdgeInsets.zero,)
            : Positioned(
                bottom: CartIconDimens.positionBottom,
                right: CartIconDimens.positionRight,
                child: Container(
                  width: CartIconDimens.widthBadge,
                  height: CartIconDimens.heightBadge,
                  padding: EdgeInsets.all(CartIconDimens.paddingBadge ),
                  decoration: BoxDecoration(
                      color: ThemeColors.selected.withOpacity(1),
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      widget.countItems.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CartIconDimens.fontSizeCountItems ,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
      ],
    );
  }
}
