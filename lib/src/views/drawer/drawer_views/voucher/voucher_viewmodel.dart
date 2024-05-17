import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';
import '../../../../utils/images/images.dart';

class VoucherViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  List dealImages = [
    AppImages.deal1,
    AppImages.deal2,
    AppImages.deal3,
    AppImages.deal4,
    AppImages.deal5,
  ];
}
