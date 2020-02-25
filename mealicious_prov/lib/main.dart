import 'package:flutter/material.dart';
import 'package:mealicious_prov/providers/app_provider.dart';
import 'package:mealicious_prov/providers/detail_provider.dart';
import 'package:mealicious_prov/providers/favorite_provider.dart';
import 'package:mealicious_prov/providers/home_provider.dart';
import 'package:mealicious_prov/providers/shopping_cart_provider.dart';
import 'package:mealicious_prov/screens/splash.dart';
import 'package:provider/provider.dart';

import 'common/constant.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DetailsProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingCartProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
//          darkTheme: Constants.darkTheme,
          home: Splash(),
        );
      },
    );
  }
}
