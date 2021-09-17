import 'package:flutter/painting.dart';

var kMainBackgroundImage = const BoxDecoration(
  image: DecorationImage(
    image: NetworkImage(
      "https://www.acouplecooks.com/wp-content/uploads/2021/02/Raspberry-Martini-010.jpg",
    ),
    fit: BoxFit.cover,
  ),
);

var kWhiteBackground = const BoxDecoration(
  color: Color(0xDDFFFFFF),
);
