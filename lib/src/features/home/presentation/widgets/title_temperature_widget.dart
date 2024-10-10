import 'package:flutter/material.dart';
import 'package:weather_app/src/features/home/presentation/widgets/sun_cloud_angled_rain_widget.dart';

class TitleTemperatureWidget extends StatelessWidget {
  final String graus;
  final String max;
  final String min;

  const TitleTemperatureWidget(
      {super.key, required this.graus, required this.max, required this.min});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SunCloudAngledRainWidget(
          assetName: 'assets/images/sun_smile.png',
        ),
        Text(
          graus,
          style: const TextStyle(
            fontSize: 56,
            color: Colors.white,
          ),
        ),
        const Text(
          'Precipitations',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max.: ${max}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Min.: ${min}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
