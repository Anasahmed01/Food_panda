import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/sub_payment/widget/select_payment_meth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';

class SubscriptionViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToSubPayment({required String month, required String subsPrice}) {
    locator<NavigationService>().replaceWithTransition(
      SelectPymentMethodView(),
    );
  }
}
