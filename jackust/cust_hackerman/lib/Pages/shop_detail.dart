import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class ShopDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RadarChart(
          features: <String>["Sweet", "Sour", "Bit", "Salt", "Spicy"],
          ticks: <int>[1, 2, 3, 4, 5],
          data: <List<int>>[[5, 4, 1, 3, 2], [3, 4, 5, 5, 5]],
          ),
      ),
    );    
  }
}