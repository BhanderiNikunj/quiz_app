import 'dart:math';
import 'package:flutter/foundation.dart';

class Quizprovider extends ChangeNotifier {
  List optionlist = [];
  List randomlist = [];
  List userlist = [];
  int i = 1;

  void random_Option(List<String>? falseans, String? trueans) {
    optionlist.clear();
    randomlist.clear();
    optionlist = List.from(falseans!);
    optionlist.add(trueans);

    for (int k = 0; k < 4; k++) {
      Random random = Random();
      int number = random.nextInt(optionlist.length);
      randomlist.add(optionlist[number]);
      optionlist.removeAt(number);
    }
    notifyListeners();
  }

  void i_add() {
    i++;
    optionlist.clear();
    randomlist.clear();
    notifyListeners();
  }

  void start() {
    i = 1;
    notifyListeners();
  }
}