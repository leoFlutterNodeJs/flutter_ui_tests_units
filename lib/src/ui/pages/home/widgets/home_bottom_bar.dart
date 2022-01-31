import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:ui_tests_units/src/data/models/bottom_item_bar.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/ui/pages/home/widgets/home_tab_bar_indicator.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class HomeBottomBar extends StatelessWidget {
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
          controller.items.length,
          (index) => BottomBarTab(
            index: index,
            items: controller.items,
            isActive: currentPage == index,
          ),
        ),
      ),
    );
  }
}

class BottomBarTab extends StatelessWidget {
  final List<BottomBarItem> items;
  final bool? isActive;
  final int index;

  BottomBarTab({
    required List<BottomBarItem> this.items,
    required this.index,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isActive! ? primaryColor : Colors.black;
    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Tab(
        icon: SvgPicture.asset(
          items[index].icon,
          width: 25,
          color: color,
        ),
      ),
    );
    return Tab(
      icon: items[index].badgeCount > 0
          ? Badge(
              badgeContent: Text(
                "${items[index].badgeCount}",
                style: TextStyle(color: Colors.white),
              ),
              animationType: BadgeAnimationType.scale,
              child: content,
            )
          : content,
    );
  }
}
