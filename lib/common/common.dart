import 'package:flutter/material.dart';

var textInputDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100.0),
  borderSide: const BorderSide(
    color: Colors.black,
  ),
);
var textStyleBold15Gray = const TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 143, 143, 143),
);
var textStyleBold20 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
var textStyleBold40 = const TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
var textStyleBold30 = const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);
var textStyleBold20Gray = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Color.fromARGB(255, 143, 143, 143),
);
var textStyleNomal20 = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: Colors.black,
);
var gradation01 = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [
    const Color.fromARGB(255, 255, 156, 156).withOpacity(0.6),
    const Color.fromARGB(255, 162, 241, 255).withOpacity(0.6),
  ],
  stops: const [
    0.0,
    0.5,
  ],
);
var gradation02 = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [
    const Color.fromARGB(255, 255, 197, 197).withOpacity(0.6),
    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
  ],
  stops: const [
    0.0,
    1.0,
  ],
);

var gradation03 = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomCenter,
    colors: [
      Colors.red,
      Colors.red,
      Colors.white,
    ],
    stops: [
      0,
      0.65,
      0.5
    ]);
