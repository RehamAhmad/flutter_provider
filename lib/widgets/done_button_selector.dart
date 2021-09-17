import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:provider/provider.dart';

class DoneButtonSelector extends StatelessWidget {
  const DoneButtonSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DrinksProvider>(context, listen: false);
    print('build: DoneButtonSelector ::::');
    var _color = context.select((DrinksProvider p) => p.color);
    return InkWell(
      onTap: () {
        provider.setColor(Colors.amber);
      },
      child: Container(
        height: 40,
        width: 240,
        color: _color,
        child: const Center(child: Text('Done')),
      ),
    );
    return Selector<DrinksProvider, Color>(
        selector: (_, provider) => provider.color,
        builder: (_, color, __) {
          print("REBUILD BUTTON");
          return InkWell(
            onTap: () {
              provider.setColor(Colors.amber);
            },
            child: Container(
              height: 40,
              width: 240,
              color: provider.color,
              child: const Center(child: Text('Done')),
            ),
          );
        });
  }
}
