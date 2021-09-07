import 'package:flutter/material.dart';

class Validators {
  //String valueCheck = "";
  static FormFieldValidator check(
          TextEditingController? valuePW, String message) =>
      (value) {
        final valueCheck = valuePW?.text ?? '';
        if (value == null || (value != null && value != valueCheck)) {
          return message;
        }
        return null;
      };
}
