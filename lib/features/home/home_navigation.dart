import 'package:flutter/material.dart';
import 'package:fuira_fan_verse/features/chatbot/chat_bot_screnn.dart';
import 'package:fuira_fan_verse/features/home/home_screen.dart';
import 'package:fuira_fan_verse/features/live/live_screen.dart';
import 'package:fuira_fan_verse/features/store/store_screnn.dart';
import 'package:fuira_fan_verse/shared/widgets/custom_navbar.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    HomeScreen(),
    ChatBotScrenn(),
    LiveScreen(),
    StoreScrenn(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: CustomNavbar(
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
