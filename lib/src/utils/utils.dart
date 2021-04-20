import 'package:flutter/material.dart';

class Utils {
  static InputDecoration inputDecoration({
    @required String hintText,
    @required String labelText,
    Icon icon,
  }) {
    //Borde Exterior
    final borderSide = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blueAccent,
        width: 1,
      ),
    );

    //Borde exterior de error
    final borderSideError = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
        width: 1,
      ),
    );

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      counterText: '',
      border: borderSide,
      enabledBorder: borderSide,
      focusedBorder: borderSide,
      errorBorder: borderSideError,
      prefixIcon: icon,
    );
  }
}
