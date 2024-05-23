import 'package:foodpanda/src/views/auth/sign_in.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/help_center/help_center.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/orders/order.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_pro/panda_pro.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/panda_reward/panda_reward.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/profile/profile.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/settings/settings.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/terms_condition/term_con.dart';
import 'package:foodpanda/src/views/drawer/drawer_views/voucher/voucher.dart';
import 'package:foodpanda/src/views/favourite/favourite.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import 'drawer_views/addresses/address.dart';

class DrawerViewModel extends BaseViewModel {
  navigateToAddressView() {
    locator<NavigationService>().navigateWithTransition(
      const AddressView(),
    );
  }

  navigateToProfileView() {
    locator<NavigationService>().navigateWithTransition(
      const ProfileView(),
    );
  }

  navigateToFavouriteView() {
    locator<NavigationService>().navigateWithTransition(
      const FavouriteView(),
    );
  }

  navigateToPandaProView() {
    locator<NavigationService>().navigateWithTransition(
      const PandaProView(),
    );
  }

  navigateToVoucherView() {
    locator<NavigationService>().navigateWithTransition(
      const VoucherView(),
    );
  }

  navigateToPandaRewardView() {
    locator<NavigationService>().navigateWithTransition(
      const PandaRewardView(),
    );
  }

  navigateToOrderView() {
    locator<NavigationService>().navigateWithTransition(
      const OrderView(),
    );
  }

  navigateToHelpCenterView() {
    locator<NavigationService>().navigateWithTransition(
      const HelpCenterView(),
    );
  }

  navigateToSettingsView() {
    locator<NavigationService>().navigateWithTransition(
      const SettingsView(),
    );
  }

  navigateToTermCondView() {
    locator<NavigationService>().navigateWithTransition(
      const TermCondView(),
    );
  }

  navigateToSignInView() {
    locator<NavigationService>().navigateWithTransition(
      const SignInView(),
    );
  }
}
