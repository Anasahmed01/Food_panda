import 'package:foodpanda/src/views/discover_res/discover_restaurant.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../utils/images/images.dart';

class VoucherViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToDiscoverRestaurantView({required String productImage}) {
    locator<NavigationService>().navigateWithTransition(
      DiscoverRestaurantView(
        productImage: productImage,
      ),
    );
  }

  List dealImages = [
    AppImages.deal1,
    AppImages.deal2,
    AppImages.deal3,
    AppImages.deal4,
    AppImages.deal5,
  ];
}
