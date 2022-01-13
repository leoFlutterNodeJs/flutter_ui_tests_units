import 'package:meta/meta.dart';

class Dish {
  final int id;
  final String name, preview, description;
  final double price, rate;

  Dish({
    @required this.id,
    @required this.name,
    @required this.preview,
    @required this.description,
    @required this.price,
    @required this.rate,
  });
}
