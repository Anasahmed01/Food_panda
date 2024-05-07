import 'package:foodpanda/src/views/cart/cart.dart';
import 'package:foodpanda/src/views/order_details/order_details.dart';
import 'package:foodpanda/src/views/resturant_detail/resturant_detail.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../views/basic/splash/splash.dart';
import '../views/cart/widget/update_quantity/update_quantity.dart';
import '../views/category/category.dart';
import '../views/home/home.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: CategoryView),
  MaterialRoute(page: ResturantDetailView),
  MaterialRoute(page: OrderDetailView),
  MaterialRoute(page: CartView),
  MaterialRoute(page: UpdateQuantity),
], dependencies: [
  Singleton(classType: NavigationService),
])
class App {}
