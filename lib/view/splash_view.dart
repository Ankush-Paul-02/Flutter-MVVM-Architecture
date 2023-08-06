import 'package:flutter/material.dart';
import 'package:flutter_mvvm/res/colors.dart';
import 'package:flutter_mvvm/view_model/services/splash_services.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          'Splash Screen'
              .text
              .white
              .bold
              .size(30)
              .color(AppColors.cyan)
              .make()
              .centered(),
        ],
      ),
    );
  }
}
