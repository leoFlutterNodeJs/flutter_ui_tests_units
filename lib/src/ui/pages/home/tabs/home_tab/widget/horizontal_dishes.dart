import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

class HorizontalDishes extends StatelessWidget {
  final List<Dish> dishes;
  final String title;
  final VoidCallback onViewAll;
  final double widthPercent;
  const HorizontalDishes({
    Key key,
    @required this.dishes,
    @required this.title,
    @required this.onViewAll,
    @required this.widthPercent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * widthPercent;
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              imageUrl: item.preview,
                              width: width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: -1,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(.45),
                                    Colors.white,
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                        text: "R\$",
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "${item.price}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal,
                                              )),
                                        ],
                                      )),
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 10,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              item.rate.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
