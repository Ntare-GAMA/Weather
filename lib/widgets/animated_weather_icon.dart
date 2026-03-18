import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimatedWeatherIcon extends StatelessWidget {
  final String lottieAsset;
  final double size;

  const AnimatedWeatherIcon({
    super.key,
    required this.lottieAsset,
    this.size = 90,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Lottie.asset(lottieAsset, fit: BoxFit.contain),
    );
  }
}
