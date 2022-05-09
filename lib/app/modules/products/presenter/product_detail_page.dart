import 'package:devnology/app/modules/products/presenter/constants/dimens.dart';
import 'package:devnology/app/modules/products/presenter/components/carousel_slider_product_images/carousel_slider_product_images.dart';
import 'package:devnology/app/modules/products/presenter/components/product_app_bar/product_app_bar_widget.dart';
import 'package:devnology/app/modules/products/presenter/components/product_bottom_app_bar/product_bottom_app_bar_widget.dart';
import 'package:devnology/app/modules/products/presenter/constants/colors.dart';
import 'package:devnology/app/modules/products/presenter/product_detail_controller.dart';
import 'package:devnology/app/shared/helpers/convert_double_to_currency.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailPage extends StatefulWidget {
  final String title;
  final String id;
  const ProductDetailPage(
      {Key? key, this.title = 'ProductDetailPage', required this.id})
      : super(key: key);
  @override
  ProductDetailPageState createState() => ProductDetailPageState();
}

class ProductDetailPageState
    extends ModularState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    controller.getProduct(widget.id);
    controller.getCountCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.product?.id == null) {
        return Container();
      }
      return Scaffold(
          backgroundColor: ProductsThemeColors.background,
          bottomNavigationBar: ProductBottomAppBarWidget(
            onPressedShare: () => Share.share(controller.product?.url ?? ""),
            onPressedAddToCart: controller.addToCart,
          ),
          appBar:
              ProductAppBarWidget(countCartItems: controller.countCartItems),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
                left: ProductsDimens.marginLeftScreen,
                right: ProductsDimens.marginRightScreen),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ProductsDimens.marginTopScreen,
                ),
                Text(
                  controller.product?.name ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ProductsDimens.fontSizeProductName,
                      color: Colors.black),
                ),
                SizedBox(
                  height: ProductsDimens.marginTopCarousel,
                ),
                CarouselSliderProductImages(
                    images: controller.product?.images ?? []),
                SizedBox(
                  height: ProductsDimens.marginTopPrice,
                ),
                Text(
                  "Price: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ProductsDimens.fontSizePriceTitleProduct,
                      color: Colors.black),
                ),
                Text(
                  convertDoubleToCurrency(controller.product?.price ?? 0),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ProductsDimens.fontSizeProductPrice ,
                      color: Colors.black),
                ),
                SizedBox(
                  height: ProductsDimens.marginTopDescriptionTitle ,
                ),
                Text(
                  "About this item: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ProductsDimens.fontSizeProductDescriptionTitle,
                      color: Colors.black),
                ),
                SizedBox(
                  height: ProductsDimens.marginTopDescription,
                ),
                Text(
                  controller.product?.description ?? "",
                  style: TextStyle(fontSize: ProductsDimens.fontSizeProductDescription , color: Colors.black),
                ),
              ],
            ),
          ));
    });
  }
}
