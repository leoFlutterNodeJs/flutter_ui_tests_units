import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/routes/routes.dart';
import 'package:ui_tests_units/src/ui/global_controllers/cart_controller.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasItem = context.select<CartController, bool>((_) => _.hasItem);
    if (!hasItem) return Container();

    final cart = context.select<CartController, Map<int?, Dish>>((_) => _.cart);
    return Stack(
      children: [
        FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Routes.CART),
          child: SvgPicture.asset(
            "assets/svg/icons/cart.svg",
            width: 25,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepOrangeAccent,
            ),
            alignment: Alignment.center,
            child: Text(
              "${cart.length}",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
