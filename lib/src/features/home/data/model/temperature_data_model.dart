// Adicione a classe TemperatureData para armazenar os dados
import 'package:flutter/material.dart';

class TemperatureDataModel {
  final String graus;
  final String hour;
  final String day;
  final String max;
  final String min;
  final Icon iconWheater;
  final Icon? calendarIcon;

  TemperatureDataModel({
    this.calendarIcon,
    required this.graus,
    required this.hour,
    required this.day,
    required this.max,
    required this.min,
    required this.iconWheater,
  });
}
