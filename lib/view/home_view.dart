import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 'Home'.text.make().centered(),
    );
  }
}
