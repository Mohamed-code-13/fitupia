import 'package:first_app/presentation/themes/appbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  static const String routeName = '/stats_screen';

  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int startingBMI = 30;
  int currentBMI = 25;
  int startingWeight = 90;
  int currentWeight = 70;
  int completedDays = 50;
  int missedDays = 30;
  List<ChartData> weights = [
    ChartData('Jan', 35),
    ChartData('Feb', 28),
    ChartData('Mar', 34),
    ChartData('Apr', 32),
    ChartData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Statistics',
        Colors.white,
        const Color.fromARGB(255, 6, 85, 149),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(
                  text: "Weights",
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              series: <ChartSeries>[
                LineSeries<ChartData, String>(
                  enableTooltip: true,
                  dataSource: weights,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                )
              ],
            ),
            _getText('Starting BMI: $startingBMI'),
            _getText('Current BMI: $currentBMI'),
            _getText('Starting Weight: $startingWeight'),
            _getText('Current Weight: $currentWeight'),
            _getText('Completed days: $completedDays'),
            _getText('Missed days: $missedDays'),
          ],
        ),
      ),
    );
  }

  Widget _getText(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}