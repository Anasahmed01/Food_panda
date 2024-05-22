import 'package:foodpanda/src/views/drawer/drawer_views/terms_condition/term_con.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/app.locator.dart';

class PandaRewardViewModel extends BaseViewModel {
  navigateToBack() {
    locator<NavigationService>().back();
  }

  navigateToTermCondView() {
    locator<NavigationService>().replaceWithTransition(
      const TermCondView(),
    );
  }
}
