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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
          child: Column(
            children: [
              Row(
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
                        const Icon(Icons.help),
                ],
              ),
              const SizedBox(height: 8),
              // Usando ListView.builder para exibir os dados de temperatura
              SizedBox(
                height: forecastType == ForecastType.today
                    ? 100
                    : 220, // Defina a altura do ListView
                child: ListView.builder(
                  scrollDirection: forecastType == ForecastType.today
                      ? Axis.horizontal // Muda para horizontal se for 'today'
                      : Axis.vertical,
                  itemCount: temperatureData.length,
                  itemBuilder: (context, index) {
                    final data = temperatureData[index];

                    if (forecastType == ForecastType.today) {
                      return _TempTodayHour(
                        graus: data.graus,
                        icon: data.iconWheater,
                        hour: data.hour,
                      );
                    } else {
                      return _TempNextHourWidget(
                        day: data.day,
                        max: data.max,
                        min: data.min,
                        icon: data.iconWheater,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
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
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
      ),
      child: Container(
        width: 64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(graus),
            const SizedBox(height: 8),
            icon,
            const SizedBox(height: 8),
            Text(hour),
          ]),
        ),
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
              Text(day),
              icon,
              Row(
                children: [
                  Text(max),
                  const SizedBox(width: 8),
                  Text(min),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
