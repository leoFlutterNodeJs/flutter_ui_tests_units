import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/category.dart';
import 'package:ui_tests_units/src/ui/pages/home/tabs/home_tab/home_tab_controller.dart';

class CategoriesMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeTabController>(context, listen: false);
    return Container(
      height: 125,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(controller.categories.length, (index) {
          final category = controller.categories[index];
          return CategoryButton(category: category);
        }),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: SvgPicture.asset(
                  category.iconPath,
                  width: 80,
                ),
              ),
              SizedBox(height: 10),
              Text(
                category.label,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
