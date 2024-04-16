import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../views/basic/splash/splash.dart';
import '../views/category/category.dart';
import '../views/home/home.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: CategoryView),
], dependencies: [
  Singleton(classType: NavigationService),
])
class App {}
