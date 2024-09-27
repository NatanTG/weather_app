import 'package:flutter/material.dart';

class IntroStatsShipWidgets extends StatelessWidget {
  const IntroStatsShipWidgets(
      {super.key,
      required this.waterDropText,
      required this.waterDropIcon,
      required this.humidityText,
      required this.humidityIcon,
      required this.windText,
      required this.windIcon});
  final String waterDropText;
  final Icon waterDropIcon;
  final String humidityText;
  final Icon humidityIcon;
  final String windText;
  final Icon windIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                waterDropIcon,
                Text(waterDropText),
              ],
            ),
            Row(
              children: [
                humidityIcon,
                Text(humidityText),
              ],
            ),
            Row(
              children: [
                windIcon,
                Text(windText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
