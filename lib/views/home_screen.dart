import 'package:flutter/material.dart';
import 'package:stox/widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SappBar(),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
