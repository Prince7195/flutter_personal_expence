import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdoptiveFlatButton extends StatelessWidget {
  final String label;
  final VoidCallback handler;

  const AdoptiveFlatButton(this.label, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: handler,
          )
        : TextButton(
            onPressed: handler,
            child: Text(label),
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
