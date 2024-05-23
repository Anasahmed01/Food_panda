import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodpanda/src/views/category/category_viewmodel.dart';
import '../../widget/card.dart';

Widget seeAllFound(CategoryViewModel viewModel) {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: viewModel.popularResImg.length,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: deliveryContainer(context, index, viewModel.getResData!),
            );
          },
        ),
      ),
    ],
  );
}
