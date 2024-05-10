import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/src/del_custom_model/order_del_model.dart';
import 'package:foodpanda/src/reuseable_widget/custom_text.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:foodpanda/src/views/checkout/checkout_viewmodel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      onViewModelReady: (viewModel) => viewModel.getAddress(),
      builder: (context, viewModel, child) {
        var addAddress = {
          "address": viewModel.address,
          "city": viewModel.city,
        };
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: viewModel.kMapCenter, zoom: 5, tilt: 90),
                  markers: Set<Marker>.of(viewModel.markers),
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  onMapCreated: (GoogleMapController controller) {
                    viewModel.controller.complete(controller);
                  },
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: GestureDetector(
                    onTap: () => viewModel.navigateToBack(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.white),
                      child: Icon(
                        CupertinoIcons.xmark,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: viewModel.address == ''
              ? Container(
                  height: 0,
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: 190,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: CustomText.customSizedText(
                            text: viewModel.address,
                            maxLine: 2,
                            fontWeight: FontWeight.w900,
                            textAlign: TextAlign.start,
                            size: 16),
                        subtitle:
                            CustomText.customSizedText(text: viewModel.city),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.edit_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        leading: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          viewModel.navigateToBack();

                          addresses.add(addAddress);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: AppColors.primaryColor,
                            content: CustomText.customSizedText(
                                text: 'Address add successfuly!',
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                                size: 16),
                            duration: const Duration(seconds: 2),
                          ));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.sizeOf(context).width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor),
                          child: Center(
                            child: CustomText.customSizedText(
                                text: 'Add address',
                                fontWeight: FontWeight.w800,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: GestureDetector(
            onTap: () async {
              viewModel.getUserCurrentLocation().then((value) async {
                viewModel.lat = value.latitude;
                viewModel.long = value.longitude;

                print(value.latitude.toString() +
                    " " +
                    value.longitude.toString());

                // marker added for current users location
                viewModel.markers.add(Marker(
                  markerId: const MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(
                    title: 'My Current Location',
                  ),
                ));

                // specified current users location
                CameraPosition cameraPosition = CameraPosition(
                  target: LatLng(value.latitude, value.longitude),
                  zoom: 14,
                  tilt: 17.5,
                );

                final GoogleMapController controller =
                    await viewModel.controller.future;
                controller.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                viewModel.rebuildUi();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(15),
              child: Icon(
                Icons.my_location_rounded,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
