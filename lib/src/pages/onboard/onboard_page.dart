import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './onboard_controller.dart';
import 'widgets/onboard_controls.dart';

class OnboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      create: (_) => OnboardController(),
      builder: (context, __) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(child: Container()),
                OnboardControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
