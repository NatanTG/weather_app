import 'package:flutter/material.dart';

class SunCloudAngledRainWidget extends StatelessWidget {
  const SunCloudAngledRainWidget({super.key, required this.assetName});
  final String assetName;
  @override
  Widget build(BuildContext context) {
    final Widget image = Image.asset(
      assetName,
      width: 400,
      height: 250,
    );
    return Center(
      child: image,
    );
  }
}
