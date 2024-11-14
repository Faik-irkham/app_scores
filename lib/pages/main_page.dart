import 'package:app_scores/constant/theme.dart';
import 'package:app_scores/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  static final List<Widget> _pages = [
    const HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  void onTappedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: navbarColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: whiteColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/home.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/document.png',
              width: 24,
              height: 24,
            ),
            label: 'document',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/bookmark.png',
              width: 24,
              height: 24,
            ),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onTappedItem,
      ),
    );
  }
}
