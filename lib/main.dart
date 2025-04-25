import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/core/widgets/app_colors.dart';
import 'package:fuira_fan_verse/data/news_data.dart';
import 'package:fuira_fan_verse/features/home/home_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsData())
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
