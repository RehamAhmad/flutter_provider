import 'package:flutter/material.dart';
import 'package:flutter_provider/constants.dart';
import 'package:flutter_provider/models/drink_model.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:flutter_provider/widgets/done_button_selector.dart';
import 'package:flutter_provider/widgets/drink_widget.dart';
import 'package:flutter_provider/widgets/done_button.dart';
import 'package:provider/provider.dart';

class CheckboxDrinkProviderScreen extends StatelessWidget {
  const CheckboxDrinkProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var drinkProvider = context.watch<DrinksProvider>();
    var drinkProvider = context.watch<DrinksProvider>();
    // var length = drinkProvider.selectedDrinks;
    print('build:::::');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              child: ListView(
                children: [
                  // Consumer 1
                  Container(
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Drinks tonight",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        ...drinkProvider.drinks
                            .map(
                              (drink) => DrinksWidget(
                                drink: drink,
                                onChanged: (value) {
                                  drinkProvider.selectDrink(drink, value);
                                },
                              ),
                            )
                            .toList(),
                        Text(
                          "The order is: ",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => ListTile(
                              title: Text(
                                drinkProvider.drinks.toList()[index].name,
                              ),
                            ),
                            itemCount: drinkProvider.selectedDrinks.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // provider 2
                  const DoneButtonSelector(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
