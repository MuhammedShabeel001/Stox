import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stox/views/home_screen.dart';
import 'package:stox/views/wishlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final PageController _pageController =
      PageController(); // Controller for PageView

  final List<Widget> _screens = [const HomeScreen(), const WishlistScreen()];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration:
          const Duration(milliseconds: 300), // Duration for smooth animation
      curve: Curves.easeInOut, // Smooth curve for transition
    );
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // Dispose the controller when the screen is closed
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
        children: _screens, // Disable swiping between tabs
      ),
      bottomNavigationBar: FlashyTabBar(
        items: [
          FlashyTabBarItem(
            icon: const FaIcon(FontAwesomeIcons.house),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const FaIcon(FontAwesomeIcons.clipboardList),
            title: const Text('Wishlist'),
          ),
        ],
        onItemSelected: _onTapped,
        selectedIndex: _selectedIndex,
        showElevation: false,
      ),
    );
  }
}
