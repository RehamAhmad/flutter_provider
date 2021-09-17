import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:flutter_provider/screens/check_drink_provider_screen.dart';
import 'package:flutter_provider/screens/checkbox_drink_screen.dart';
import 'package:flutter_provider/screens/checkbox_drink_selector_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => DrinksProvider(),
        child: const CheckboxDrinkProviderScreen(),
        //CheckboxDrinkSelectorScreen
        //CheckboxDrinkScreen
        //CheckboxDrinkProviderScreen
      ),
    );
  }
}
