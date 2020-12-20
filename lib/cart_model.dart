import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  String name;
  double price;

  Product({this.name, this.price});

  int count = 1;
  double get totalPrice => price * count;

  incrementCount() {
    count++;
    notifyListeners();
  }

  decrementCount() {
    count--;
    notifyListeners();
  }
}
