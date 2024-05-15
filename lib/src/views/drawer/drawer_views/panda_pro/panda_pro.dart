import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/panda_pro_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PandaProView extends StatelessWidget {
  const PandaProView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PandaProViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
