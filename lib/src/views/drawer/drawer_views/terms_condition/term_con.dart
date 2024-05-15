import 'package:flutter/material.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/terms_condition/term_con_viewmodel.dart';
import 'package:stacked/stacked.dart';
import '../../../../reuseable_widget/app_bar.dart';
import 'widget/widget.dart';

class TermCondView extends StatelessWidget {
  const TermCondView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TermCondViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              icon: Icons.arrow_back_outlined,
              ontap: () => viewModel.navigateToBack(),
              title: 'Privacy Policy'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  termConHeading(),
                  termContentContainer(),
                  termConHeading(),
                  termContentContainer(),
                  termConHeading(),
                  termContentContainer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
