import 'package:devnology/app/modules/home/presenter/components/products/constants.dart';
import 'package:devnology/app/shared/helpers/convert_double_to_currency.dart';
import 'package:devnology/core/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  const ProductItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Modular.to.pushNamed('/products', arguments: product.id);
      },
      child: Container(
        width: ProductsDimens.widthProductItemCard,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(ProductsDimens.borderRadiusProductItem))),
        padding: EdgeInsets.symmetric(horizontal: ProductsDimens.paddingHorizontalProductItem, vertical: ProductsDimens.paddingVerticalProductItem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    product.images[0],
                    width: ProductsDimens.widthProductItemImage,
                    height: ProductsDimens.heightProductItemImage,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                )),
            Flexible(
              child: Text(
                product.name,
                style: TextStyle(fontSize: ProductsDimens.fontSizeProductItemName),
                overflow: TextOverflow.ellipsis,
                maxLines: ProductsDimens.maxLinesProductItemName,
              ),
            ),
            Flexible(
              child: Text(
                convertDoubleToCurrency(product.price),
                style: TextStyle(fontSize: ProductsDimens.fontSizeProductItemPrice, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
