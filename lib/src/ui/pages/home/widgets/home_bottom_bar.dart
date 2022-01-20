import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/ui/pages/home/widgets/home_tab_bar_indicator.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class HomeBottomBar extends StatelessWidget {
  final List<_BottomBarItem> _items = [
    _BottomBarItem(icon: 'assets/svg/icons/home.svg', label: "Home"),
    _BottomBarItem(icon: 'assets/svg/icons/favorite.svg', label: "Favorites"),
    _BottomBarItem(icon: 'assets/svg/icons/bell.svg', label: "Notificatons"),
    _BottomBarItem(icon: 'assets/svg/icons/avatar.svg', label: "Profile"),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context, listen: false);
    final int currentPage =
        context.select<HomeController, int>((_) => _.currentPage);
    return SafeArea(
      top: false,
      child: TabBar(
        controller: controller.tabController,
        indicator: HomeTabBarIndicator(),
        tabs: List.generate(
          _items.length,
          (index) => BottomBarTab(
            index: index,
            items: _items,
            isActive: currentPage == index,
          ),
        ),
      ),
    );
  }
}

class BottomBarTab extends StatelessWidget {
  final List<_BottomBarItem> items;
  final bool? isActive;
  final int index;

  BottomBarTab({
    required List<_BottomBarItem> this.items,
    required this.index,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive! ? primaryColor : Colors.black;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Tab(
        icon: SvgPicture.asset(
          items[index].icon,
          width: 25,
          color: color,
        ),
      ),
    );
  }
}

class _BottomBarItem {
  final String icon, label;
  _BottomBarItem({required this.icon, required this.label});
}
