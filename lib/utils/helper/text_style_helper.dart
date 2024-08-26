import 'package:flutter/material.dart';

abstract class AppTextStyleHelper {
  static const TextStyle font28WhiteBold = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle font32WhiteBold = TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
  );


  static TextStyle font18GreyRegular = TextStyle(
    color: Colors.grey[300],
    fontSize: 18,
  );

  static TextStyle font18WhiteRegular = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
}