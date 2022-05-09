import 'package:devnology/app/modules/home/presenter/components/categories/categories_widget.dart';
import 'package:devnology/app/modules/home/presenter/components/latests/latests_widget.dart';
import 'package:devnology/app/modules/home/presenter/components/products/products_widget.dart';
import 'package:devnology/app/modules/home/presenter/constants/colors.dart';
import 'package:devnology/app/modules/home/presenter/constants/dimens.dart';
import 'package:devnology/app/modules/home/presenter/home_controller.dart';
import 'package:devnology/app/shared/components/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'package:devnology/app/shared/components/default_app_bar/default_app_bar_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'HomePage'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeController> {

  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.getCountCartItems();
    return Observer(
      builder: (_)=>Scaffold(
          backgroundColor: HomeThemeColors.background,
          bottomNavigationBar: BottomNavigationBarWidget(countCartItems: controller.countCartItems),
          appBar: DefaultAppBarWidget(),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: HomeDimens.marginLeftScreen),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: HomeDimens.marginTopCategories ),
                CategoriesWidget(),
                SizedBox(height: HomeDimens.marginTopLatest),
                LatestWidget(),
                SizedBox(height: HomeDimens.marginTopProducts),
                ProductsWidget(products: controller.latestProducts)
                // ProductsWidget()
              ],
            ),
          )),
    );
  }
}
