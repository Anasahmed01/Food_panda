import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class SettingsViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  List settings = [
    'Receive push notifications',
    'receive offers by email',
    'Show floating icon',
  ];

  List isChecked = [
    true,
    true,
    true,
  ];
}
