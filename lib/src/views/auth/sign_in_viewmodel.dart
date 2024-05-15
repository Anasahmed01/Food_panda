import 'package:foodpanda/src/api/google_sign_api.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
  Future signIn() async {
    await GoogleSignInApi.login();
  }
}
