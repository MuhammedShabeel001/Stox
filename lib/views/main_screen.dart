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

  final List<Widget> _screens = [const HomeScreen(), const WishlistScreen()];
  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        items: [
          FlashyTabBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: FaIcon(FontAwesomeIcons.clipboardList),
            title: Text('Wishlist'),
          ),
        ],
        onItemSelected: _onTapped,
        selectedIndex: _selectedIndex,
        showElevation: false,
      ),
    );
  }
}
