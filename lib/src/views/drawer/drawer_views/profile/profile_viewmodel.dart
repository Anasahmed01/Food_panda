import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class ProfileViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }
}
