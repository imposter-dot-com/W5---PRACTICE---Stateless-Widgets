import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Weather App'),
          actions: const [Icon(Icons.menu, color: Colors.white)],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: WeatherList(),
        ),
      ),
    ),
  );
}

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        WeatherCard(
          city: "PhnomPenh",
          weatherImage: "assets/ex4/cloudy.png",
          minTemp: 10.0,
          maxTemp: 30.0,
          currentTemp: 12.2,
          gradient: LinearGradient(
            colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        SizedBox(height: 16),
        WeatherCard(
          city: "Paris",
          weatherImage: "assets/ex4/sunnyCloudy.png",
          minTemp: 10.0,
          maxTemp: 40.0,
          currentTemp: 22.2,
          gradient: LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        SizedBox(height: 16),
        WeatherCard(
          city: "Rome",
          weatherImage: "assets/ex4/sunny.png",
          minTemp: 10.0,
          maxTemp: 40.0,
          currentTemp: 45.2,
          gradient: LinearGradient(
            colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        SizedBox(height: 16),
        WeatherCard(
          city: "Toulouse",
          weatherImage: "assets/ex4/veryCloudy.png",
          minTemp: 10.0,
          maxTemp: 40.0,
          currentTemp: 45.2,
          gradient: LinearGradient(
            colors: [Color(0xFFFFB75E), Color(0xFFED8F03)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ],
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String city;
  final String weatherImage;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final Gradient gradient;

  const WeatherCard({
    super.key,
    required this.city,
    required this.weatherImage,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          // Gradient background
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(24),
            ),
          ),

          Positioned(
            right: -30,
            top: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
          ),

          // Main row content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white.withValues(alpha: 0.25),
                      backgroundImage: AssetImage(weatherImage),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Min ${minTemp.toStringAsFixed(1)}°C',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Max ${maxTemp.toStringAsFixed(1)}°C',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                
                Text(
                  '${currentTemp.toStringAsFixed(1)}°C',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
