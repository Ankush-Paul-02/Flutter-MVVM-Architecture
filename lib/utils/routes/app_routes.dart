import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view/home_view.dart';
import 'package:flutter_mvvm/view/login_view.dart';
import 'package:flutter_mvvm/view/signup_view.dart';
import 'package:velocity_x/velocity_x.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );  
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: 'No routes found'.text.semiBold.make().centered(),
          ),
        );
    }
  }
}
