import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  final String hour;
  final String temp;
  final bool isNow;
  final IconData icon;

  const HourlyForecastCard({
    super.key,
    required this.hour,
    required this.temp,
    required this.icon,
    this.isNow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isNow ? Colors.white.withOpacity(0.18) : Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hour, style: TextStyle(fontSize: 13, color: isNow ? Colors.yellow : Colors.white70)),
          const SizedBox(height: 6),
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(height: 6),
          Text(temp, style: const TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}
