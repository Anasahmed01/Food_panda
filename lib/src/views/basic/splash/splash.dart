import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/basic/splash/splash_viewmodel.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/utils/images/images.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (viewModel)async {
       await viewModel.init();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: SizedBox(
                height: 170,
                width: 170,
                child: Image.asset(AppImages.splashImage)),
          ),
        );
      },
    );
  }
}
