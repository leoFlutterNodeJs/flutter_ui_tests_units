import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:ui_tests_units/src/ui/global_controllers/cart_controller.dart';
import 'package:ui_tests_units/src/ui/pages/dish/dish_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  void _addToCart(BuildContext context) {
    final cartController = context.read<CartController>();
    final controller = context.read<DishController>();
    cartController.addToCart(controller.dish);
    final SnackBar snackBar = SnackBar(
      duration: Duration(milliseconds: 300),
      content: Text(
        "Added to cart",
        textAlign: TextAlign.center,
      ),
      backgroundColor: primaryColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<DishController>(context, listen: false);
    final isInCart = context
        .select<CartController, bool>((_) => _.isInCart(controller.dish));
    return CupertinoButton(
      onPressed: () => _addToCart(context),
      padding: EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(30),
      color: primaryColor,
      child: Icon(isInCart ? Icons.shopping_cart : Icons.add_shopping_cart),
    );
  }
}
