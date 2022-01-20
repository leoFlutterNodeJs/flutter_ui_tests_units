import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_tests_units/src/ui/global_controllers/cart_controller.dart';
import 'package:ui_tests_units/src/utils/colors.dart';
import 'package:ui_tests_units/src/utils/font_styles.dart';

class CheckoutPreview extends StatelessWidget {
  const CheckoutPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CartController>();
    if (!controller.hasItem) return Container(height: 0);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ).copyWith(top: 35),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Table(
              children: [
                _buildTableRow("Subtotal", controller.subtotal),
                _buildTableRow("Frete:", controller.delivery),
                _buildTableRow("Total", controller.total),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: CupertinoButton(
                color: primaryColor,
                onPressed: () {},
                child: Text(
                  "CHECKOUT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, double value) {
    return TableRow(
      children: [
        Text(label),
        Text(
          "R\$ ${value.toStringAsFixed(2)}",
          style: FontStyles.title.copyWith(fontSize: 14),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
