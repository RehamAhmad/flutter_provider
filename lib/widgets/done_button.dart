import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/drink_provider.dart';
import 'package:provider/provider.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build: DoneButton ::::');

    return Consumer<DrinksProvider>(
      builder: (_, color, __) {
        print('Consumer DoneButton --- ');
        return InkWell(
          onTap: () {
            Provider.of<DrinksProvider>(context, listen: false).setColor(Colors.amber);
          },
          child: Container(
            height: 40,
            width: 240,
            color: color.color,
            child: Center(child: Text("$color")),
          ),
        );
      },
    );
  }
}
