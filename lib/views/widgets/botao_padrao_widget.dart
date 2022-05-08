// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  String text;
  void Function()? onPressed;
  BotaoPadrao({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        child: Text(text),
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red[400]),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 15)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red.shade700))),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 15))),
      ),
    );
  }
}
