import 'dart:async';
import 'package:foodpanda/src/views/drawer/drawer_views/addresses/address.dart';
import 'package:foodpanda/src/views/checkout/widget/google_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CheckoutViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToGoogleMapView() {
    locator<NavigationService>().navigateWithTransition(
      const GoogleMapView(),
    );
  }

  navigateToAddressView() {
    locator<NavigationService>().navigateWithTransition(
      const AddressView(),
    );
  }

  bool isToggled = false;

  String locationMessage = "Add you'r current location";

  double lat = 0.0;
  double long = 0.0;
  String address = '';
  String city = '';

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

  //Google map
  Completer<GoogleMapController> controller = Completer();

  LatLng kMapCenter = const LatLng(37.4219983, -122.084);

  final List<Marker> markers = <Marker>[
    const Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  getAddress() {
    Geolocator.getPositionStream().listen((Position position) {
      lat = position.latitude;
      long = position.longitude;

      getAddressFromLatLang(position);
    });
    notifyListeners();
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address = '${place.street},${place.subAdministrativeArea}';
    city = '${place.locality}';
    notifyListeners();
  }
}
