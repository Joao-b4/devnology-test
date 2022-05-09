import 'package:devnology/app/modules/home/presenter/components/latests/constants.dart';
import 'package:devnology/app/modules/home/presenter/constants/dimens.dart';
import 'package:devnology/app/shared/components/header_title/header_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LatestWidget extends StatelessWidget {
  const LatestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitleWidget(title: "Latest"),
          SizedBox(height: HomeDimens.marginBetweenTitleAndContent),
          Container(
            width: double.infinity,
            height: LatestsDimins.heightLatestItem,
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _buildLatestItem('assets/images/latest1.png'),
                  SizedBox(width: LatestsDimins.marginBetweenLatestItems),
                  _buildLatestItem('assets/images/latest2.png'),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildLatestItem(String image) {
    return Image.asset(
      image,
      filterQuality: FilterQuality.high,
      fit: BoxFit.contain,
      alignment: Alignment.center,
    );
  }
}
