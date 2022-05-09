import 'package:devnology/app/modules/home/presenter/components/categories/constants.dart';
import 'package:devnology/app/modules/home/presenter/constants/dimens.dart';
import 'package:devnology/app/shared/components/header_title/header_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: "Categories"),
          SizedBox(height: HomeDimens.marginBetweenTitleAndContent),
          Container(
            padding: EdgeInsets.only(right: HomeDimens.marginRightScreen),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryItem('assets/images/apparel.png', "Apparel"),
                  _buildCategoryItem('assets/images/beauty.png', "Beauty"),
                  _buildCategoryItem('assets/images/shoes.png', "Shoes"),
                  _buildCategoryItem('assets/images/seeall.png', "See All"),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String image, String label){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          filterQuality: FilterQuality.high,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          width: CategoriesDimins.sizeCategoryItemImage,
        ),
        SizedBox(height: CategoriesDimins.marginBetweenCategoryItemComponents),
        Text(label)
      ],
    );
  }
}
