import 'package:flutter/material.dart';

abstract class AppStyle {
  static const TextStyle styleMedium25 = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle styleMedium22 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black);
  static const TextStyle styleRegular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleRegular20 = TextStyle(
    color: Colors.black.withOpacity(.8),
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle styleBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle styleSemiBold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
}
