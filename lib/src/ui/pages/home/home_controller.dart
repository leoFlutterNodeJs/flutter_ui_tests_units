import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  final TabController tabController =
      TabController(length: 5, vsync: NavigatorState());

  void afterFirstLayout() {
    this.tabController.addListener(() {
      _currentPage = tabController.index;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    this.tabController?.dispose();
    super.dispose();
  }
}
