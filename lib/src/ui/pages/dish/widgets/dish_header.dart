import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dish_controller.dart';

class DishHeader extends StatelessWidget {
  const DishHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 6,
      child: Stack(
        children: [
          Positioned.fill(
            child: Builder(
              builder: (context) {
                final controller =
                    Provider.of<DishController>(context, listen: false);
                return Hero(
                  tag: "${controller.tag}",
                  child: CachedNetworkImage(
                    imageUrl: controller.dish.preview!,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: CupertinoButton(
                color: Colors.white30,
                padding: EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(30),
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
