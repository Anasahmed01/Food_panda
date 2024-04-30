import 'package:flutter/material.dart';
import 'app_bar.dart';

Widget appScafold({
  Widget? body,
  String? appBarTitle,
  void Function()? onBackTap,
  bool isScrollable = false,
}) {
  return Scaffold(
    appBar: customAppBar(
      onPressed: onBackTap,
      title: appBarTitle ?? '',
    ),
    body: isScrollable == true
        ? SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: body,
          )
        : body,
  );
}
