import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class HomeBottomBar extends StatelessWidget {
  final List<_BottomBarItem> _items = [
    _BottomBarItem(icon: 'assets/svg/icons/home.svg', label: "Home"),
    _BottomBarItem(icon: 'assets/svg/icons/favorite.svg', label: "Favorites"),
    _BottomBarItem(icon: 'assets/svg/icons/bell.svg', label: "Notificatons"),
    _BottomBarItem(icon: 'assets/svg/icons/cart.svg', label: "Cart"),
    _BottomBarItem(icon: 'assets/svg/icons/avatar.svg', label: "Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);
    final int currentPage =
        context.select<HomeController, int>((_) => _.currentPage);
    return Container(
      child: SafeArea(
        child: Row(
          children: List.generate(
            _items.length,
            (index) => BottomBarItemButton(
              items: _items,
              index: index,
              isActive: currentPage == index,
              onPressed: () => controller.setPage(index),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarItemButton extends StatelessWidget {
  final List<_BottomBarItem> items;
  final bool isActive;
  final int index;
  final VoidCallback onPressed;

  BottomBarItemButton({
    @required List<_BottomBarItem> this.items,
    @required this.index,
    @required this.onPressed,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive ? primaryColor : Colors.black;
    return Expanded(
      child: CupertinoButton(
        padding: EdgeInsets.symmetric(vertical: 10),
        onPressed: this.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              items[index].icon,
              width: 25,
              color: color,
            ),
            SizedBox(height: 5),
            Text(
              items[index].label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final String icon, label;
  _BottomBarItem({@required this.icon, @required this.label});
}
