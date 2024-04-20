import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class CartViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  List<bool> isSelected = [
    false,
    false,
    false,
    false,
  ];

  List softDrinks = [
    'Next Cola - 345 ml',
    'Mirinda - 345 ml',
    'dew - 345 ml',
    '7up - 345 ml',
  ];

  List<bool> isChecked = [
    false,
    false,
    false,
    false,
  ];

  List optionalItem = [
    'Dinner Roll',
    'Coleslaw',
    'Chicken piece',
    'Cheese',
  ];

  List optionalItemPrice = [
    '300.00',
    '100.00',
    '180.00',
    '70.00',
  ];

  List bottomSheetItem = [
    'Remove it from my order',
    'Cancel the entire order',
    'Call me & Confirm',
  ];

  List bottomSheetIsSelected = [
    false,
    false,
    false,
  ];
}
