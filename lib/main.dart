import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/models/providers/auth_provider.dart';
import 'package:fuira_fan_verse/data/filter_data.dart';
import 'package:fuira_fan_verse/data/shop_data.dart';
import 'package:fuira_fan_verse/shared/app_colors.dart';
import 'package:fuira_fan_verse/data/news_data.dart';
import 'package:fuira_fan_verse/features/home/home_navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsData()),
        ChangeNotifierProvider(create: (_) => ShopData()),
        ChangeNotifierProvider(create: (_) => FilterData()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors.brackgroundColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeNavigation(),
    );
  }
}
