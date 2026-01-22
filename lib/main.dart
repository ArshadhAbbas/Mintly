import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mintly/utils/app_constants.dart/app_theme.dart';
import 'package:mintly/utils/config/go_router_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: const MintlyApp()));
}

class MintlyApp extends StatelessWidget {
  const MintlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp.router(title: 'Mintly', theme: AppTheme.light(), themeMode: ThemeMode.light, routerConfig: GoRouterConfig.router),
    );
  }
}
