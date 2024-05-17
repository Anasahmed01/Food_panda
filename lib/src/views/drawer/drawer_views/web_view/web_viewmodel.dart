import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class WebViewModel extends BaseViewModel {
  late InAppWebViewController controller;

  navigateToBack() {
    locator<NavigationService>().back();
  }
}
