import 'package:flutter/material.dart';

import '../../data/model/temperature_data_model.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/intro_stats_ship_widgets.dart';
import '../widgets/title_temperature_widget.dart';
import '../widgets/custom_appbar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TemperatureDataModel> todayData = List.generate(
    4,
    (index) => TemperatureDataModel(
      graus: '${20 + index}°',
      hour: '${index + 1}:00',
      day: 'May, 24',
      max: '30°',
      min: '20°',
      calendarIcon: const Icon(Icons.calendar_today, color: Colors.white),
      iconWheater: const Icon(Icons.cloud, color: Colors.white),
    ),
  );

  final List<TemperatureDataModel> nextForecastData = List.generate(
    7,
    (index) => TemperatureDataModel(
      graus: '${22 + index}°',
      hour: '${index + 1}:00',
      day: 'Monday',
      max: '28°',
      min: '18°',
      calendarIcon: const Icon(Icons.calendar_today, color: Colors.white),
      iconWheater: const Icon(Icons.cloud, color: Colors.white),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbarWidget(city: 'Caraguatatuba'),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF08244F),
                  Color(0xFF0B42AB),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                const TitleTemperatureWidget(
                  graus: '25°',
                  max: '30°',
                  min: '20°',
                ),
                const SizedBox(height: 8),
                const IntroStatsShipWidgets(
                  waterDropText: '6%',
                  waterDropIcon: Icon(Icons.water_drop, color: Colors.white),
                  humidityText: '90%',
                  humidityIcon: Icon(Icons.dew_point, color: Colors.white),
                  windText: '10 km/h',
                  windIcon: Icon(Icons.air, color: Colors.white),
                ),
                const SizedBox(height: 8),
                CustomContainerWidget(
                  title: 'Today',
                  forecastType: ForecastType.today,
                  temperatureData: todayData,
                ),
                const SizedBox(height: 8),
                CustomContainerWidget(
                  title: 'Next Forecast',
                  forecastType: ForecastType.nextForecast,
                  temperatureData: nextForecastData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
