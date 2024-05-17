import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/reuseable_widget/app_bar.dart';
import 'package:foodpanda/src/reuseable_widget/app_textfield.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/help_center/help_center_viewmodel.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/help_center/widget/widget.dart';
import 'package:stacked/stacked.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HelpCenterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: appAppbar(
              icon: CupertinoIcons.xmark,
              ontap: () => viewModel.navigateToBack(),
              title: 'How can we help!'),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomTextFields.appTextField(
                      prefixIcon: CupertinoIcons.search,
                      height: 50,
                      hintText: 'Press enter to 🔎(Eg: "Account" & enter)'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomText.customSizedText(
                        maxLine: 3,
                        size: 15,
                        textAlign: TextAlign.start,
                        text:
                            "Note: if you're trying to search for anything related to you ongoing orders, navigate to 'Get Help with My Orders'"),
                  ),
                  drawerListTile(
                      leading: const Icon(Icons.shopping_bag_outlined),
                      title: 'Get help with my orders'),
                  drawerListTile(
                      leading: const Icon(CupertinoIcons.bag_fill_badge_minus),
                      title: "I'm having trouble placing an order"),
                  drawerListTile(
                      leading: const Icon(CupertinoIcons.mail),
                      title: 'My support requests'),
                  drawerListTile(
                      leading: const Icon(Icons.bakery_dining_rounded),
                      title: 'pandapro'),
                  drawerListTile(
                      leading: const Icon(Icons.restaurant_rounded),
                      title: 'Dine In'),
                  drawerListTile(
                      leading: const Icon(CupertinoIcons.bolt_horizontal_fill),
                      title: 'pandago'),
                  drawerListTile(
                      leading: const Icon(CupertinoIcons.person_crop_circle),
                      title: 'My Account'),
                  drawerListTile(
                      leading: const Icon(Icons.volunteer_activism_sharp),
                      title: 'Safety Conscerns'),
                  drawerListTile(
                      leading: const Icon(Icons.credit_card),
                      title: 'Payment and Refunds'),
                  drawerListTile(
                      leading: const Icon(CupertinoIcons.tickets),
                      title: 'Vouchers and rewards'),
                  drawerListTile(
                      leading: const Icon(Icons.call_to_action_sharp),
                      title: 'Get help with my pandapay'),
                  drawerListTile(
                      leading: const Icon(Icons.more_horiz_rounded),
                      title: 'FAQ'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
