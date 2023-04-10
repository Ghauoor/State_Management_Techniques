import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  List favList = [];

  addToList(index) {
    favList.add(index);
    notifyListeners();
  }

  removeFav(index) {
    favList.remove(index);
    notifyListeners();
  }
}
