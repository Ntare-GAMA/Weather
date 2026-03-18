import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WeatherGlassCard extends StatelessWidget {
  final String city;
  final String description;
  final int temperature;
  final String lottieAsset;
  final bool isDay;

  const WeatherGlassCard({
    super.key,
    required this.city,
    required this.description,
    required this.temperature,
    required this.lottieAsset,
    required this.isDay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDay
              ? [Colors.blue.shade300, Colors.yellow.shade200]
              : [Colors.indigo.shade700, Colors.blueGrey.shade900],
        ),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.3)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 60,
                    child: Lottie.asset(lottieAsset, fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    city,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$temperature°C',
                    style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
