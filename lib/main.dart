import 'package:alippo_assignment/providers/get_cart_provider.dart';
import 'package:alippo_assignment/providers/get_products_provider.dart';
import 'package:alippo_assignment/views/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'constants/app_colors.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('DefaultDB');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetProductsList()),
        ChangeNotifierProvider(create: (_) => GetCartProvider()),
      ],
      child: MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Alippo Assignment',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.themecolor)
                .copyWith(background: AppColors.backgroundColor),
          ),
          home: const MainScreen()),
    );
  }
}
