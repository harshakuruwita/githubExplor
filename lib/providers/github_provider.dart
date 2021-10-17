import 'package:flutter/material.dart';

class GithubProvider extends ChangeNotifier {
  List<dynamic> _repositoryList = [];
  int _pageCount = 1;
  List<dynamic> get repositoryList => _repositoryList;
  int get pageCount => _pageCount;

  void setRepositoryList(List<dynamic> list) {
    _repositoryList.addAll(list);
    _pageCount = _pageCount + 1;
    notifyListeners();
  }
}
