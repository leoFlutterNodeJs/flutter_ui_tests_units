import 'package:meta/meta.dart';

class Dish {
  final int id;
  final String name, preview, description;
  final double price, rate;
  final int counter;

  Dish({
    @required this.id,
    @required this.name,
    @required this.preview,
    @required this.description,
    @required this.price,
    @required this.rate,
    this.counter = 0,
  });

  Dish updateCounter(int counter) {
    return Dish(
      id: this.id,
      name: this.name,
      preview: this.preview,
      description: this.description,
      price: this.price,
      rate: this.rate,
      counter: counter,
    );
  }
}
