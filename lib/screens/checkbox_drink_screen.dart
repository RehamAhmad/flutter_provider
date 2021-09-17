import 'package:flutter/material.dart';
import 'package:flutter_provider/constants.dart';
import 'package:flutter_provider/models/drink_model.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:flutter_provider/widgets/drink_widget.dart';
import 'package:flutter_provider/widgets/done_button.dart';
import 'package:provider/provider.dart';

class CheckboxDrinkScreen extends StatelessWidget {
  const CheckboxDrinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var drinkProvider = Provider.of<DrinksProvider>(context);
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

                  Consumer<DrinksProvider>(
                    builder: (context, provider, child) {
                      print('Consumer CheckboxDrinkScreen  ---  --------------/');
                      print(provider.drinks);
                      print(provider.selectedDrinks);
                      return Container(
                        height: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drinks tonight",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            ...provider.drinks
                                .map(
                                  (drink) => DrinksWidget(
                                    drink: drink,
                                    onChanged: (value) {
                                      provider.selectDrink(drink, value);
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
                                    provider.drinks.toList()[index].name,
                                  ),
                                ),
                                itemCount: provider.selectedDrinks.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // Consumer 2
                  DoneButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
