import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/auth_view_model.dart';
import 'package:flutter_mvvm/utils/routes/app_routes.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
