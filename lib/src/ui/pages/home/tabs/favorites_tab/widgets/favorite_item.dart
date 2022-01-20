import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/helpers/get.dart';
import 'package:ui_tests_units/src/ui/pages/home/home_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteItem extends StatelessWidget {
  final Dish dish;
  const FavoriteItem({Key? key, required this.dish}) : super(key: key);

  void _deleteItem() {
    final homeController = Get.i.find<HomeController>()!;
    homeController.deleteFavorite(dish);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actions: [],
      secondaryActions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10).copyWith(bottom: 5),
          child: IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: _deleteItem,
          ),
        )
      ],
      child: Container(
        margin: EdgeInsets.all(10).copyWith(bottom: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: dish.preview!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(dish.name!),
                  SizedBox(height: 5),
                  Text("${dish.price}"),
                  SizedBox(height: 5),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white,
                          ),
                          Text(
                            "${dish.rate}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
