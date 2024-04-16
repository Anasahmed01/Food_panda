import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodpanda/src/utils/colors/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'src/app/app.locator.dart';
import 'src/app/app.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          drawerTheme: DrawerThemeData(
            width: MediaQuery.sizeOf(context).width * 0.85,
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: AppColors.primaryColor, titleSpacing: 0)),
      debugShowCheckedModeBanner: false,
    );
  }
}
