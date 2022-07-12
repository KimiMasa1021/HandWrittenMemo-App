import 'package:flutter/material.dart';

var textInputDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100.0),
  borderSide: const BorderSide(
    color: Colors.black,
  ),
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

var gradation01 = LinearGradient(
  begin: FractionalOffset.topLeft,
  end: FractionalOffset.bottomRight,
  colors: [
    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
    const Color.fromARGB(255, 162, 241, 255).withOpacity(0.6),
  ],
  stops: const [
    0.0,
    1.0,
  ],
);
