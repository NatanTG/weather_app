// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../widgets/custom_container_widget.dart';
// import '../widgets/intro_stats_ship_widgets.dart';
// import '../widgets/title_temperature_widget.dart';
// import '../widgets/custom_appbar_widget.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: const CustomAppbarWidget(city: 'Caraguatatuba'),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const TitleTemperatureWidget(
//                   graus: '25°', max: '30°', min: '20°'),
//               const IntroStatsShipWidgets(
//                 waterDropText: '6%',
//                 waterDropIcon: Icon(Icons.water_drop),
//                 humidityText: '90%',
//                 humidityIcon: Icon(Icons.dew_point),
//                 windText: '10 km/h',
//                 windIcon: Icon(Icons.air),
//               ),
//               CustomContainerWidget(
//                   title: 'Today',
//                   forecastType: ForecastType.today,
//                   temperatureData: [
//                     TemperatureData(
//                       graus: '',
//                       hour: '',
//                       day: '',
//                       max: '',
//                       min: '',
//                       icon: Icon(Icons.cloud),
//                     ),
//                   ]),
//               const SizedBox(height: 20),
//               CustomContainerWidget(
//                 title: 'Next Forecast',
//                 forecastType: ForecastType.nextForecast,
//                 temperatureData: [
//                   TemperatureData(
//                     graus: '',
//                     hour: '',
//                     day: '',
//                     max: '',
//                     min: '',
//                     icon: Icon(Icons.cloud),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/temperature_data_model.dart';
import '../widgets/custom_container_widget.dart';
import '../widgets/intro_stats_ship_widgets.dart';
import '../widgets/title_temperature_widget.dart';
import '../widgets/custom_appbar_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Simulando dados de temperatura para demonstração
  final List<TemperatureDataModel> todayData = List.generate(
    4,
    (index) => TemperatureDataModel(
      graus: '${20 + index}°',
      hour: '${index + 1}:00',
      day: 'May, 24',
      max: '30°',
      min: '20°',
      calendarIcon: Icon(Icons.calendar_today),
      iconWheater: Icon(Icons.cloud),
    ),
  );

  final List<TemperatureDataModel> nextForecastData = List.generate(
    76,
    (index) => TemperatureDataModel(
      graus: '${22 + index}°',
      hour: '${index + 1}:00',
      day: 'Monday',
      max: '28°',
      min: '18°',
      calendarIcon: Icon(Icons.calendar_today),
      iconWheater: Icon(Icons.cloud),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbarWidget(city: 'Caraguatatuba'),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TitleTemperatureWidget(
                  graus: '25°', max: '30°', min: '20°'),
              const IntroStatsShipWidgets(
                waterDropText: '6%',
                waterDropIcon: Icon(Icons.water_drop),
                humidityText: '90%',
                humidityIcon: Icon(Icons.dew_point),
                windText: '10 km/h',
                windIcon: Icon(Icons.air),
              ),
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
    );
  }
}
