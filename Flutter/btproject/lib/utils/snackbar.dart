import 'package:flutter/material.dart';


enum ABC { a, b }

class SnackBarView {
  static final snackBarKeyA = GlobalKey<ScaffoldMessengerState>();
  static final snackBarKeyB = GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> getSnackbar(ABC abc) {
    switch (abc) {
      case ABC.a:
        return snackBarKeyA;
      case ABC.b:
        return snackBarKeyB;
    }
  }

  static show(ABC abc, String msg, {required bool success}) {
    final snackBar = success
        ? SnackBar(content: Text(msg), backgroundColor: Colors.blue)
        : SnackBar(content: Text(msg), backgroundColor: Colors.red);
    getSnackbar(abc).currentState?.removeCurrentSnackBar();
    getSnackbar(abc).currentState?.showSnackBar(snackBar);
  }

}
