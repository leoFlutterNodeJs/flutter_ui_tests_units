import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/data/models/dish.dart';
import 'package:ui_tests_units/src/ui/global_controllers/cart_controller.dart';
import 'package:ui_tests_units/src/ui/global_widgets/dish_counter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItem extends StatelessWidget {
  final Dish dish;
  const CartItem({Key? key, required this.dish}) : super(key: key);

  void _deleteItem(BuildContext context) {
    final cartController = context.read<CartController>();
    cartController.deleteFromCart(dish);
  }

  void _onCounterChanged(BuildContext context, int counter) {
    final updateDish = dish.updateCounter(counter);
    final cartController = context.read<CartController>();
    cartController.addToCart(updateDish);
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
            onTap: () => _deleteItem(context),
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
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DishCounter(
                            initialValue: dish.counter,
                            size: DishCounterSize.min,
                            onChanged: (counter) =>
                                _onCounterChanged(context, counter)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("Unit Price: ${dish.price}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
