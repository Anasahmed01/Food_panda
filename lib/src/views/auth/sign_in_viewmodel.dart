import 'package:foodpanda/src/api/google_sign_api.dart';
import 'package:foodpanda/src/views/home/home.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';

class SignInViewModel extends BaseViewModel {
  Future signIn() async {
    await GoogleSignInApi.login();
  }

  navigateToHomeView() {
    locator<NavigationService>().navigateWithTransition(
      const HomeView(),
    );
  }
}
