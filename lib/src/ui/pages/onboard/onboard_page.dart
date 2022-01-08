import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './onboard_controller.dart';
import 'widgets/onboard_controls.dart';
import 'widgets/onboard_sliders.dart';

class OnboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) {
        final controller = OnboardController();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.afterFirstLayout();
        });
        return controller;
      },
      builder: (context, __) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                OnboardSlider(),
                OnboardControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
