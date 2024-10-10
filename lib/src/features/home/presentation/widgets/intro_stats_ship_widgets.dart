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
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF001026).withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                waterDropIcon,
                Text(waterDropText,
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: [
                humidityIcon,
                Text(humidityText, style: const TextStyle(color: Colors.white)),
              ],
            ),
            Row(
              children: [
                windIcon,
                Text(windText, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
