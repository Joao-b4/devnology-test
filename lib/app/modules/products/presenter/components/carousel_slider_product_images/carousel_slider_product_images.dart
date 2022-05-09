import 'package:carousel_slider/carousel_slider.dart';
import 'package:devnology/app/modules/products/presenter/components/carousel_slider_product_images/constants.dart';
import 'package:flutter/material.dart';

class CarouselSliderProductImages extends StatefulWidget {
  final List<String> images;
  const CarouselSliderProductImages({Key? key, required this.images})
      : super(key: key);

  @override
  _CarouselSliderProductImagesState createState() =>
      _CarouselSliderProductImagesState();
}

class _CarouselSliderProductImagesState
    extends State<CarouselSliderProductImages> {
  final CarouselController _controller = CarouselController();
  int _currentImage = 0;
  List<Widget> imagesSliders = [];

  @override
  void initState() {
    imagesSliders = _buildImageSliders(widget.images);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Column(
      children: [
        Container(
          height: queryData.size.height * 0.25,
          width: double.infinity,
          child: CarouselSlider(
            items: imagesSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: CarouselSliderProductImagesDimens
                    .aspectRatioCaroulselOptions,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentImage = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imagesSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: CarouselSliderProductImagesDimens.widthDot,
                height: CarouselSliderProductImagesDimens.heightDot,
                margin: EdgeInsets.symmetric(
                    vertical:
                        CarouselSliderProductImagesDimens.marginVerticalDot,
                    horizontal:
                        CarouselSliderProductImagesDimens.marginHorizontalDot),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_currentImage == entry.key
                            ? CarouselSliderProductImagesThemeColors
                                .opacityActiveDot
                            : CarouselSliderProductImagesThemeColors
                                .opacityDisableDot)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  List<Widget> _buildImageSliders(List<String> images) => images
      .map((image) => Container(
            child: Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
            ),
          ))
      .toList();
}
