import 'package:foodpanda/src/views/checkout/widget/google_map.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class AddressViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToGoogleMapView() {
    locator<NavigationService>().navigateWithTransition(
      const GoogleMapView(),
    );
  }

  String? selectedValue;
}
