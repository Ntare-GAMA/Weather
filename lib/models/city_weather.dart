import 'package:flutter/material.dart';

class CityWeather {
  final String city;
  final String description;
  final int temperature;
  final String lottieAsset;
  final bool isDay;
  final List<HourlyWeather> hourly;
  final List<WeatherDetail> details;

  CityWeather({
    required this.city,
    required this.description,
    required this.temperature,
    required this.lottieAsset,
    required this.isDay,
    required this.hourly,
    required this.details,
  });
}

class HourlyWeather {
  final String hour;
  final String temp;
  final IconData icon;
  final bool isNow;

  HourlyWeather({
    required this.hour,
    required this.temp,
    required this.icon,
    this.isNow = false,
  });
}

class WeatherDetail {
  final String label;
  final String value;
  final String? subValue;
  final IconData? icon;

  WeatherDetail({
    required this.label,
    required this.value,
    this.subValue,
    this.icon,
  });
}
