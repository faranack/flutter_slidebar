/*-----------------------------Start SnackBar---------------------------------*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void freeFunction() {
  print('actionOnPressed:');
}

void snackFunc(
    {message,
    scaffoldKey,
    backgroundColor,
    actionOnPressed,
    actionTextColor,
    actionLabel,
    contentTextAlign,
    durationSeconds}) {
  scaffoldKey.currentState!.showSnackBar(new SnackBar(
    content: new Text(
      message,
      textAlign: contentTextAlign ?? TextAlign.right,
      style: TextStyle(color: Colors.black),
    ),
    duration: Duration(seconds: durationSeconds ?? 5),
    action: SnackBarAction(
      label: actionLabel ?? 'Undo',
      textColor: actionTextColor ?? Colors.black,
      onPressed: () {
        actionOnPressed is Function ? actionOnPressed() : scaffoldKey.currentState.removeCurrentSnackBar();
      },
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    backgroundColor: backgroundColor ?? Colors.white,
  ));
}

/*End SnackBar*/
