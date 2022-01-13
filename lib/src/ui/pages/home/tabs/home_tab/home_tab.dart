import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import 'widget/widgets.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) {
        final controller = HomeTabController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.05),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello!, Leo Silva"),
                Text("Make your own food, stay at home",
                    style: FontStyles.title),
                SizedBox(height: 15),
                SearchButton(),
                SizedBox(height: 15),
                CategoriesMenu(),
                SizedBox(height: 15),
                Builder(builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Popular Menu",
                    onViewAll: () {},
                  );
                }),
                SizedBox(height: 25),
                Builder(builder: (context) {
                  final List<Dish> popularMenu =
                      context.select<HomeTabController, List<Dish>>(
                    (_) => _.popularMenu,
                  );
                  return HorizontalDishes(
                    dishes: popularMenu,
                    title: "Today",
                    onViewAll: () {},
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
