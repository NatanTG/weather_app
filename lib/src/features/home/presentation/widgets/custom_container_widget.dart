import 'package:flutter/material.dart';
import '../../data/model/temperature_data_model.dart';

enum ForecastType { today, nextForecast }

class CustomContainerWidget extends StatelessWidget {
  final String title;
  final List<TemperatureDataModel> temperatureData;
  final ForecastType forecastType;

  const CustomContainerWidget({
    super.key,
    required this.title,
    required this.temperatureData,
    required this.forecastType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF001026).withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  if (forecastType == ForecastType.today)
                    Text(
                      temperatureData.first.day,
                      style: const TextStyle(color: Colors.white),
                    )
                  else
                    temperatureData.first.calendarIcon ??
                        const Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: forecastType == ForecastType.today ? 100 : 220,
              child: ListView.builder(
                scrollDirection: forecastType == ForecastType.today
                    ? Axis.horizontal
                    : Axis.vertical,
                itemCount: temperatureData.length,
                itemBuilder: (context, index) {
                  final data = temperatureData[index];

                  if (forecastType == ForecastType.today) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 4),
                      child: _TempTodayHour(
                        graus: data.graus,
                        icon: data.iconWheater,
                        hour: data.hour,
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: _TempNextHourWidget(
                        day: data.day,
                        max: data.max,
                        min: data.min,
                        icon: data.iconWheater,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TempTodayHour extends StatelessWidget {
  final String graus;
  final Icon icon;
  final String hour;

  const _TempTodayHour({
    super.key,
    required this.graus,
    required this.icon,
    required this.hour,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF2566A3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            graus,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          icon, // Ícone no meio
          Text(
            hour,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _TempNextHourWidget extends StatelessWidget {
  final String day;
  final String max;
  final String min;
  final Icon icon;

  const _TempNextHourWidget({
    super.key,
    required this.day,
    required this.max,
    required this.min,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                day,
                style: const TextStyle(color: Colors.white),
              ),
              icon,
              Row(
                children: [
                  Text(
                    max,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    min,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
