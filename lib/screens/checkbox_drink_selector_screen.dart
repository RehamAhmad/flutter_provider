import 'package:flutter/material.dart';
import 'package:flutter_provider/constants.dart';
import 'package:flutter_provider/models/drink_model.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:flutter_provider/widgets/done_button_selector.dart';
import 'package:flutter_provider/widgets/drink_widget.dart';
import 'package:flutter_provider/widgets/done_button.dart';
import 'package:provider/provider.dart';

class CheckboxDrinkSelectorScreen extends StatelessWidget {
  const CheckboxDrinkSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var drinkProvider = Provider.of<DrinksProvider>(context, listen: false);
    print('build CheckboxDrinkSelectorScreen selector...');
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
                  Container(
                      height: 500,
                      child: Selector<DrinksProvider, dynamic>(
                          selector: (_, provider) => [
                                provider.drinks,
                                provider.selectedDrinks,
                              ],
                          shouldRebuild: (prev, next) {
                            return (prev != next);
                          },
                          builder: (_, drinks, __) {
                            List<Drink> ds = drinks[0];
                            List<Drink> sds = drinks[1];

                            print('CheckboxDrinkSelectorScreen selector....');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Drinks tonight",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                ...ds
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
                                        sds.toList()[index].name,
                                      ),
                                    ),
                                    itemCount: sds.length,
                                  ),
                                )
                              ],
                            );
                          })),
                  DoneButtonSelector(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
