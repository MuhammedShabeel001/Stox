import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stox/views/home_screen.dart';
import 'package:stox/views/watchlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [ HomeScreen(),  WatchlistScreen()];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const PageScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: FlashyTabBar(
        items: [
          FlashyTabBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.house,
              color: Colors.black,
            ),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
          ),
          FlashyTabBarItem(
            icon: const FaIcon(
              FontAwesomeIcons.clipboardList,
              color: Colors.black,
            ),
            title: const Text(
              'Watchlist',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        onItemSelected: (value) {
          
        },
        selectedIndex: _selectedIndex,
        showElevation: false,
      ),
    );
  }
}
