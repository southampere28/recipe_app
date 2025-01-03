import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentPageIndex = 0;

  int get currentPageIndex => _currentPageIndex;

  void setPage(int index) {
    _currentPageIndex = index;
    notifyListeners();
  }
}
