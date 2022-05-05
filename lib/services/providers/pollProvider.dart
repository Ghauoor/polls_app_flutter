import 'package:flutter/cupertino.dart';

class PollsProvider extends ChangeNotifier {
  List pollsOptions = ['', ''];
  Map pollsWeights = {};

  String pollTitle = '';

  // Funcations

  // addPollOptions(List value) {
  //   pollsOptions = value;
  //   notifyListeners();
  // }

  addPollWeight(Map value) {
    pollsWeights = value;

    notifyListeners();
  }

  addPollTitle(String value) {
    pollTitle = value;
    notifyListeners();
  }

  addPolloption() {
    pollsOptions.add('');
    notifyListeners();
  }

  removeOption() {
    pollsOptions.removeLast();
    notifyListeners();
  }

  // removeOption(int index) {
  //   pollsOptions.removeAt(index);
  //   notifyListeners();
  // }

}
