import 'package:flutter/material.dart';
import 'package:flutter_provider/models/drink_model.dart';

class DrinksWidget extends StatelessWidget {
  final Drink drink;
  final Function onChanged;

  const DrinksWidget({Key? key, required this.drink, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: drink.selected,
          onChanged: (v) => onChanged(v),
        ),
        Text(drink.name)
      ],
    );
  }
}
