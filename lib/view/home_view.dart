import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../res/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          'Home Screen'
              .text
              .white
              .bold
              .size(30)
              .color(AppColors.cyan)
              .make()
              .centered(),
          'logout'
              .text
              .white
              .bold
              .size(30)
              .color(Colors.red)
              .make()
              .centered()
              .onTap(() {
            userPreferences.remove().then((value) {
              Navigator.pushNamed(context, RoutesName.login);
            }).onError((error, stackTrace) {
              if (kDebugMode) {
                print(error);
              }
            });
          }),
        ],
      ),
    );
  }
}
