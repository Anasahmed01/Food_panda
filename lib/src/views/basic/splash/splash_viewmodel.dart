import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';

class SplashViewModel extends BaseViewModel {
  init() {
    Timer(const Duration(seconds: 2), () {
      locator<NavigationService>().replaceWithTransition(
        const HomeView(),
        opaque: true,
        duration: const Duration(milliseconds: 1500),
        transitionStyle: Transition.fade,
        curve: Curves.bounceOut,
      );
    });
  }
}
