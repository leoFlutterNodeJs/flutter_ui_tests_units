import 'package:flutter/cupertino.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

import 'dish_home_item.dart';

class HorizontalDishes extends StatelessWidget {
  final List<Dish> dishes;
  final String title;
  final VoidCallback onViewAll;
  const HorizontalDishes({
    Key key,
    @required this.dishes,
    @required this.title,
    @required this.onViewAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  this.title,
                  style: FontStyles.title,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: 20,
                  onPressed: this.onViewAll,
                  child: Text('View all'),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dishes.length,
                itemBuilder: (_, index) {
                  final item = dishes[index];
                  return DishHomeItem(item: item);
                }),
          ),
        ],
      ),
    );
  }
}
