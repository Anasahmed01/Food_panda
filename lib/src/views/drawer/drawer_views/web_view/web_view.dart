import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:stacked/stacked.dart';
import 'web_viewmodel.dart';

class WebView extends StatelessWidget {
  final String url;
  const WebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => WebViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.blackColor,
          appBar: AppBar(
            backgroundColor: AppColors.blackColor,
            title:
                CustomText.customSizedText(text: url, color: AppColors.white),
            leading: InkWell(
              onTap: () => viewModel.navigateToBack(),
              child: Icon(
                CupertinoIcons.xmark,
                color: AppColors.white,
              ),
            ),
          ),
          body: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(url),
            ),
            onProgressChanged:
                (InAppWebViewController controller, int progress) =>
                    const CircularProgressIndicator(),
            onWebViewCreated: (InAppWebViewController controller) {
              viewModel.controller = controller;
            },
          ),
        );
      },
    );
  }
}
