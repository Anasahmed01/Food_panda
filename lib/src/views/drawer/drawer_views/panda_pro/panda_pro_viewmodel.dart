import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class PandaProViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
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
}
