import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/global_controllers/cart_controller.dart';
import 'package:ui_tests_units/src/ui/pages/cart/widgets/cart_item.dart';
import 'package:ui_tests_units/src/ui/pages/cart/widgets/checkout_preview.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartController>().cart.values.toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: cart.length == 0
            ? Center(
                child: Text('Carrinho vazio!'),
              )
            : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (_, index) {
                  final dish = cart[index];
                  return CartItem(dish: dish);
                },
              ),
      ),
      bottomNavigationBar: CheckoutPreview(),
    );
  }
}
