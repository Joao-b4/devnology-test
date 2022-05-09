import 'package:devnology/app/modules/home/presenter/components/products/constants.dart';
import 'package:devnology/app/modules/home/presenter/components/products/product_item_widget.dart';
import 'package:devnology/app/modules/home/presenter/constants/dimens.dart';
import 'package:devnology/core/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductsWidget extends StatelessWidget {
  final List<Product> products;
  const ProductsWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: HomeDimens.marginRightScreen),
        height: ProductsDimens.heightContainerParentProducts,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (BuildContext context, int index) =>
                VerticalDivider(),
            itemBuilder: (context, index) =>
                ProductItemWidget(product: products[index],)));
  }

}
