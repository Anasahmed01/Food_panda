import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/sub_payment/sub_payment.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class PandaProViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToSubPayment({required String month, required String subsPrice}) {
    locator<NavigationService>().replaceWithTransition(
      SubscriptionView(
        month: month,
        subsPrice: subsPrice,
      ),
    );
  }

  var monthlyPerkTitleData = [
    'Unlimited free deliveries',
    'Up to 50% off restaurant',
    'Exclusive deals on restaurants, dine-in and more'
  ];

  var monthlyPerkSubTitleData = [
    'Free deliveries on your food and grocery orders',
    'Valid for selected restaurants',
    'Look out for exclusive discounts!'
  ];

  int seletedContiner = 2;

  selectIndex(int index) {
    seletedContiner = index;
    rebuildUi();
  }
}
