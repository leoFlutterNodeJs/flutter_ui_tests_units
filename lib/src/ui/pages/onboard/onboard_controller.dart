import 'package:flutter/material.dart';
import 'package:ui_tests_units/src/data/models/onboard_items.dart';

class OnboardController extends ChangeNotifier {
  final List<OnboardItems> items = [
    OnboardItems(
      image: "assets/svg/slider1.svg",
      title: "Lorem ipsum dolor sit amet!",
      description:
          "Donec egestas ex id porta commodo. Nam efficitur efficitur purus, id posuere",
    ),
    OnboardItems(
      image: "assets/svg/slider2.svg",
      title: "Etiam interdum arcu nibh!",
      description:
          "Nam egestas mauris eget ex ullamcorper, a finibus quam vulputate. Aenean aliquam",
    ),
    OnboardItems(
      image: "assets/svg/slider3.svg",
      title: "Cras bibendum velet efficitur!",
      description:
          "Nulla accumsan sollicitudin justo, a ornare sem volutpat eu. In id nunc. ",
    ),
  ];

  final PageController pageController = PageController();
  double? currentPage = 0;

  void afterFirstLayout() {
    pageController.addListener(() {
      final double? page = pageController.page;
      currentPage = page;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
