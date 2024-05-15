import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
