import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mintly/model/card_model.dart';
import 'package:mintly/model/categories_model/categories_model.dart';
import 'package:mintly/model/hive_registrar.g.dart';
import 'package:mintly/utils/app_constants.dart/app_theme.dart';
import 'package:mintly/utils/app_constants.dart/hive_boxes.dart';
import 'package:mintly/utils/config/go_router_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<CategoriesModel>(HiveBoxes.categoriesBox);
  await Hive.openBox<CardModel>(HiveBoxes.cardsBox);
  runApp(ProviderScope(child: const MintlyApp()));
}

class MintlyApp extends StatelessWidget {
  const MintlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp.router(
        title: 'Mintly',
        theme: AppTheme.light(),
        themeMode: ThemeMode.light,
        routerConfig: GoRouterConfig.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
