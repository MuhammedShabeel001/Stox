import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stox/widgets/custom_appbar.dart';

import '../widgets/loader_animation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: SappBar(),
      ),
      body: LoaderAnimation(animation: 'assets/Animation3.json',), 
    );
  }
}


