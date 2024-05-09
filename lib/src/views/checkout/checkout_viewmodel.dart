import 'package:geolocator/geolocator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CheckoutViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  bool isToggled = false;

  String locationMessage = "Add you'r current location";

  late String lat;
  late String long;

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Local services are disable');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Local permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Local permission are permanentaly denied, we cannot request permission');
    }
    return await Geolocator.getCurrentPosition();
  }
}
