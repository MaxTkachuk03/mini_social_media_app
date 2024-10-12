import 'package:flutter/material.dart';

void displayMessageToUser(String error, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(error),
          ));
}
