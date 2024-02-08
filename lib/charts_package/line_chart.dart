import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:uni_marks/data_base/boxes.dart';
import 'package:uni_marks/domain/mark.dart';

class MarksLineChart extends StatelessWidget {
  const MarksLineChart({super.key});

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];
    List<int> detector = [];
    double counterX = marksListDataBase.get(0).marks[0].term.toDouble();
    for (Mark mark in marksListDataBase.get(0).marks) {
      if (!detector.contains(mark.term + (mark.year * 10))) {
        detector.add(mark.term + (mark.year * 10));
        spots.add(FlSpot(
            counterX++,
            marksListDataBase
                .get(0)
                .getYearTermAvg(mark.year, mark.term)
                .toDouble()));
      }
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
          backgroundColor: Color.fromARGB(255, 47, 49, 96),
          baselineX: 1,
          baselineY: 60,
          minX: 1,
          minY: 0,
          maxY: 100,
          titlesData:
              FlTitlesData(topTitles: AxisTitles(), rightTitles: AxisTitles()),
          lineBarsData: [
            LineChartBarData(
              spots: getSpots(),
              isCurved: false,
              barWidth: 3,
              dotData: FlDotData(show: false),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.green, Colors.red],
              ),
            )
          ]),
    );
  }
}
