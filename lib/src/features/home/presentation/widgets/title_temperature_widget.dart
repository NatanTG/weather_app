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
        SunCloudAngledRainWidget(
          assetName: 'assets/images/sun_smile.png',
        ),
        Text(
          graus,
          style: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'Precipitations',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Max.: ${max}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'Min.: ${min}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
