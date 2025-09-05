import 'package:flutter/material.dart';

class SelectorController extends ChangeNotifier {
  String _selected;

  SelectorController(this._selected);

  String get selected => _selected;

  set selected(String value) {
    if (_selected != value) {
      _selected = value;
      notifyListeners();
    }
  }
}