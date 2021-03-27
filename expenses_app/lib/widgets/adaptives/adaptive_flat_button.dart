import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AdaptiveFlatButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final textComp = Text(
      'Choose Date',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
    return Platform.isIOS
        ? CupertinoButton(child: textComp, onPressed: onPressed)
        : TextButton(onPressed: onPressed, child: textComp);
  }
}
