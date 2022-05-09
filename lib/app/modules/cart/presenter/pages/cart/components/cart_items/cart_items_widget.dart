import 'package:devnology/app/modules/cart/presenter/pages/cart/components/cart_items/constants.dart';
import 'package:devnology/app/shared/helpers/convert_double_to_currency.dart';
import 'package:devnology/core/domain/entities/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CartItemsWidget extends StatelessWidget {
  final List<Cart> cartItems;
  final Function onRemoveQuantity;
  final Function onAddQuantity;
  const CartItemsWidget(
      {Key? key, required this.cartItems,required this.onRemoveQuantity,required this.onAddQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: cartItems.length,
        separatorBuilder: (_, __) => Padding(
              padding: EdgeInsets.symmetric(vertical: CartItemsDimens.paddingVerticalSeparatorItems),
            ),
        itemBuilder: (context, index) {
          Cart cart = cartItems[index];
          return Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()=>Modular.to.pushNamed("/products", arguments: cart.product.id),
                child: Image.asset(
                  cart.product.images[0],
                  height: CartItemsDimens.heightImageItem ,
                  width: CartItemsDimens.widthImageItem ,
                ),
              ),
              SizedBox(width: CartItemsDimens.marginLeftImageItem),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()=>Modular.to.pushNamed("/products", arguments: cart.product.id),
                      child: Text(
                        cart.product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: CartItemsDimens.maxLinesProductName,
                        style: TextStyle(fontSize: CartItemsDimens.fontSizeProductName),
                      ),
                    ),
                    SizedBox(height: CartItemsDimens.marginTopProductPrice),
                    Text(
                      convertDoubleToCurrency(cart.product.price),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: CartItemsDimens.fontSizeProductPrice,
                          color: Colors.black),
                    ),
                    SizedBox(height: CartItemsDimens.marginTopQuantitySelector),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildSelectionQuantity(Icons.remove, () => onRemoveQuantity(cart)),
                        SizedBox(
                          width: CartItemsDimens.marginBetweenQuantitySelectors,
                        ),
                        Text(
                          cart.quantity.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: CartItemsDimens.fontSizeQuantity,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: CartItemsDimens.marginBetweenQuantitySelectors,
                        ),
                        _buildSelectionQuantity(Icons.add, () => onAddQuantity(cart)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  _buildSelectionQuantity(IconData icon, Function onPressed) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        padding: EdgeInsets.all(CartItemsDimens.paddingQuantitySelection),
        child: Center(
          child: Icon(
            icon,
            size: CartItemsDimens.sizeIconQuantitySelection,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}
