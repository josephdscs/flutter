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
      ),
    );
    return Platform.isIOS
        ? CupertinoButton(
            child: textComp,
            onPressed: onPressed,
          )
        : FlatButton(
            onPressed: onPressed,
            child: textComp,
            textColor: Theme.of(context).primaryColor,
          );
  }
}
