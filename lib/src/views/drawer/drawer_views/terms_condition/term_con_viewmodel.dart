import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class TermCondViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  // navigateToWebView(url) {
  //   locator<NavigationService>().navigateWithTransition(
  //     WebView(
  //       url: url,
  //     ),
  //   );
  // }
}
