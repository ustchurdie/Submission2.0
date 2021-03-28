import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_arduino_firebase/Widgets/FoodCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Random random = new Random();
  List<Color> colors = [Colors.green, Colors.blue, Colors.purple, Colors.red];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 10.0,
          children: [
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
            FoodCard(name: "Eggtart", rating: (random.nextDouble()*5).toStringAsFixed(1), eta: random.nextInt(30), review: random.nextInt(100), color: colors[random.nextInt(colors.length)],),
          
          ],
        ),
      ),
    );
  }
}
