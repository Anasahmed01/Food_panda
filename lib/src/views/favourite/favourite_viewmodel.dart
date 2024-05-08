import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../home/home.dart';

class FavouriteViewModel extends BaseViewModel {
  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const HomeView(),
    );
  }

  navigateToCartView() {
    locator<NavigationService>().navigateWithTransition(
      const CartView(),
    );
  }
}
