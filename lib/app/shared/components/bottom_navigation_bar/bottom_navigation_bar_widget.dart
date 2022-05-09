import 'package:devnology/app/shared/components/bottom_navigation_bar/constants.dart';
import 'package:devnology/app/shared/components/cart_icon/cart_icon_widget.dart';
import 'package:devnology/app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int currentIndex;
  final int countCartItems;
  const BottomNavigationBarWidget(
      {Key? key, this.currentIndex = 0, this.countCartItems = 0})
      : super(key: key);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ThemeColors.primary,
      elevation: 0,
      child: Container(
        padding:
            EdgeInsets.only(top: BottomNavigationBarDimens.paddingTopContent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildBottomNavigationItem(
                _buildBottomNavigationIcon(
                    Icons.home_outlined, BottomNavigationIdItems.HOME),
                "Home",
                BottomNavigationIdItems.HOME,
                onPressed: () => Modular.to.navigate('/')),

            _buildBottomNavigationItem(
                _buildBottomNavigationIcon(
                    Icons.search, BottomNavigationIdItems.SEARCH),
                "Search",
                BottomNavigationIdItems.SEARCH),

            _buildBottomNavigationItem(
                CartIconWidget(
                    countItems: widget.countCartItems,
                    color: _getColorItem(BottomNavigationIdItems.CART),
                    size: BottomNavigationBarDimens.sizeIconNavigationIcon),
                "Cart",
                BottomNavigationIdItems.CART,
                onPressed: () => Modular.to.navigate('/cart')),

            _buildBottomNavigationItem(
                _buildBottomNavigationIcon(
                    Icons.person_outline, BottomNavigationIdItems.PROFILE),
                "Profile",
                BottomNavigationIdItems.PROFILE),

            _buildBottomNavigationItem(
                _buildBottomNavigationIcon(
                    Icons.menu, BottomNavigationIdItems.MORE),
                "More",
                BottomNavigationIdItems.MORE)
          ],
        ),
      ),
    );
  }

  _buildBottomNavigationIcon(IconData icon, index) {
    return Icon(
      icon,
      color: _getColorItem(index),
      size: BottomNavigationBarDimens.sizeIconNavigationIcon,
    );
  }

  Widget _buildBottomNavigationItem(Widget icon, String label, int index,
      {Function? onPressed}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _updateIndex(index);
            });
            if (onPressed != null) {
              onPressed();
            }
          },
          child: icon,
        ),
        SizedBox(
          height: BottomNavigationBarDimens.marginTopNavigationLabel,
        ),
        Text(
          label,
          style: TextStyle(color: _getColorItem(index)),
        )
      ],
    );
  }

  Color _getColorItem(int index) {
    Color colorItem = Colors.white;
    if (index == _currentIndex) {
      colorItem = ThemeColors.selected;
    }
    return colorItem;
  }

  void _updateIndex(index) => setState(() {
        _currentIndex = index;
      });
}
