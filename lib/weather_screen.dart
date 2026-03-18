import 'package:flutter/material.dart';
import 'models/city_weather.dart';
import 'widgets/glass_card.dart';
import 'widgets/hourly_forecast_card.dart';
import 'widgets/weather_details_card.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final List<CityWeather> cities = [
    CityWeather(
      city: 'New York',
      description: 'Sunny',
      temperature: 26,
      lottieAsset: 'assets/lottie/sunny.json',
      isDay: true,
      hourly: [
        HourlyWeather(hour: 'Now', temp: '26°', icon: Icons.wb_sunny, isNow: true),
        HourlyWeather(hour: '1PM', temp: '27°', icon: Icons.wb_sunny),
        HourlyWeather(hour: '2PM', temp: '28°', icon: Icons.wb_sunny),
        HourlyWeather(hour: '3PM', temp: '29°', icon: Icons.wb_sunny),
        HourlyWeather(hour: '4PM', temp: '28°', icon: Icons.wb_sunny),
      ],
      details: [
        WeatherDetail(label: 'Humidity', value: '55%', subValue: 'Dew point: 6'),
        WeatherDetail(label: 'Wind', value: '8 km/h', subValue: 'Gusts 14 km/h'),
        WeatherDetail(label: 'Feels Like', value: '25°', subValue: 'Similar to actual'),
        WeatherDetail(label: 'Visibility', value: '20 km', subValue: 'Clear conditions'),
        WeatherDetail(label: 'UV Index', value: '6', subValue: 'High'),
        WeatherDetail(label: 'Sunrise', value: '5:58 AM', subValue: 'Sunset: 5:45 PM'),
      ],
    ),
    CityWeather(
      city: 'London',
      description: 'Cloudy',
      temperature: 18,
      lottieAsset: 'assets/lottie/cloudy.json',
      isDay: false,
      hourly: [
        HourlyWeather(hour: 'Now', temp: '18°', icon: Icons.cloud, isNow: true),
        HourlyWeather(hour: '1PM', temp: '18°', icon: Icons.cloud),
        HourlyWeather(hour: '2PM', temp: '17°', icon: Icons.cloud),
        HourlyWeather(hour: '3PM', temp: '16°', icon: Icons.cloud),
        HourlyWeather(hour: '4PM', temp: '15°', icon: Icons.cloud),
      ],
      details: [
        WeatherDetail(label: 'Humidity', value: '70%', subValue: 'Dew point: 10'),
        WeatherDetail(label: 'Wind', value: '12 km/h', subValue: 'Gusts 20 km/h'),
        WeatherDetail(label: 'Feels Like', value: '16°', subValue: 'Cooler'),
        WeatherDetail(label: 'Visibility', value: '10 km', subValue: 'Cloudy'),
        WeatherDetail(label: 'UV Index', value: '2', subValue: 'Low'),
        WeatherDetail(label: 'Sunrise', value: '6:10 AM', subValue: 'Sunset: 6:00 PM'),
      ],
    ),
    CityWeather(
      city: 'Tokyo',
      description: 'Rainy',
      temperature: 22,
      lottieAsset: 'assets/lottie/rainy.json',
      isDay: true,
      hourly: [
        HourlyWeather(hour: 'Now', temp: '22°', icon: Icons.beach_access, isNow: true),
        HourlyWeather(hour: '1PM', temp: '23°', icon: Icons.beach_access),
        HourlyWeather(hour: '2PM', temp: '22°', icon: Icons.beach_access),
        HourlyWeather(hour: '3PM', temp: '21°', icon: Icons.beach_access),
        HourlyWeather(hour: '4PM', temp: '20°', icon: Icons.beach_access),
      ],
      details: [
        WeatherDetail(label: 'Humidity', value: '80%', subValue: 'Dew point: 18'),
        WeatherDetail(label: 'Wind', value: '10 km/h', subValue: 'Gusts 18 km/h'),
        WeatherDetail(label: 'Feels Like', value: '21°', subValue: 'Humid'),
        WeatherDetail(label: 'Visibility', value: '8 km', subValue: 'Rainy'),
        WeatherDetail(label: 'UV Index', value: '3', subValue: 'Moderate'),
        WeatherDetail(label: 'Sunrise', value: '5:30 AM', subValue: 'Sunset: 5:50 PM'),
      ],
    ),
    CityWeather(
      city: 'Sydney',
      description: 'Night Clear',
      temperature: 15,
      lottieAsset: 'assets/lottie/night.json',
      isDay: false,
      hourly: [
        HourlyWeather(hour: 'Now', temp: '15°', icon: Icons.nights_stay, isNow: true),
        HourlyWeather(hour: '1AM', temp: '14°', icon: Icons.nights_stay),
        HourlyWeather(hour: '2AM', temp: '13°', icon: Icons.nights_stay),
        HourlyWeather(hour: '3AM', temp: '13°', icon: Icons.nights_stay),
        HourlyWeather(hour: '4AM', temp: '12°', icon: Icons.nights_stay),
      ],
      details: [
        WeatherDetail(label: 'Humidity', value: '60%', subValue: 'Dew point: 8'),
        WeatherDetail(label: 'Wind', value: '6 km/h', subValue: 'Gusts 10 km/h'),
        WeatherDetail(label: 'Feels Like', value: '13°', subValue: 'Cool'),
        WeatherDetail(label: 'Visibility', value: '15 km', subValue: 'Clear'),
        WeatherDetail(label: 'UV Index', value: '0', subValue: 'None'),
        WeatherDetail(label: 'Sunrise', value: '6:20 AM', subValue: 'Sunset: 7:00 PM'),
      ],
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final city = cities[currentIndex];
    return Scaffold(
      backgroundColor: city.isDay ? const Color(0xFF87CEEB) : const Color(0xFF1A1A2E),
      body: PageView.builder(
        itemCount: cities.length,
        controller: PageController(initialPage: currentIndex),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final city = cities[index];
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                WeatherGlassCard(
                  city: city.city,
                  description: city.description,
                  temperature: city.temperature,
                  lottieAsset: city.lottieAsset,
                  isDay: city.isDay,
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: city.hourly.length,
                    itemBuilder: (context, i) {
                      final h = city.hourly[i];
                      return HourlyForecastCard(
                        hour: h.hour,
                        temp: h.temp,
                        icon: h.icon,
                        isNow: h.isNow,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    children: city.details.map((d) => WeatherDetailsCard(
                      label: d.label,
                      value: d.value,
                      subValue: d.subValue,
                      icon: d.icon,
                    )).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
