import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/models/drink_model.dart';

class DrinksProvider extends ChangeNotifier {
  final List<Drink> _drinks = [
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ];
  Color _color = Colors.red;

  void selectDrink(Drink drink, bool selected) {
    drink.selected == selected;
    _drinks.firstWhere((element) => element.name == drink.name).selected = selected;
    notifyListeners();
  }

  void setColor(color) {
    _color = color;
    notifyListeners();
  }

  List<Drink> get selectedDrinks => _drinks.where((element) => element.selected).toList();

  List<Drink> get drinks => _drinks;
  Color get color => _color;
}
