import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderAnimation extends StatelessWidget {
  final String animation;
  const LoaderAnimation({
    super.key, required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(height: 340,
      child: Lottie.asset(animation),), 
    );
  }
}