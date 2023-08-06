import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/auth_repository.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  bool _signupLoading = false;
  bool get isSignupLoading => _signupLoading;

  setSignupLoading(bool load) {
    _signupLoading = load;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
      AppUtils.flushBarErrorMessage('Login successful', context);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        AppUtils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.signupApi(data).then((value) {
      setSignupLoading(false);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
      AppUtils.flushBarErrorMessage('Signup successful', context);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      if (kDebugMode) {
        AppUtils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
