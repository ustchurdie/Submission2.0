import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class FoodTemplate3 extends StatefulWidget {
  final String foodName;
  final String foodId;

  const FoodTemplate3({Key key, @required this.foodName, this.foodId})
      : super(key: key);

  @override
  _FoodTemplate3State createState() => _FoodTemplate3State();
}

class _FoodTemplate3State extends State<FoodTemplate3> {
  bool _liked = false;

  void _likeAction() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.foodName}'),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          _liked
              ? IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: _likeAction,
                  splashRadius: 20.0,
                )
              : IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: _likeAction,
                  splashRadius: 20.0,
                ),
                SizedBox(width: 40),
        ],
      ),
      body: SingleChildScrollView(
              child: Container(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            
         Container(
           height: 350,
                    child: RadarChart(
                  sides: 6,
                  ticks: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                  features: ["sour", "sweet", "salty", "oily", "bit", "spicy"],
                  data: [[2, 3, 5, 6, 8, 1],
                  [2, 6, 8, 7, 9, 3],
                  [6, 3, 4, 7, 2, 1],
                  [2, 1, 1, 1,2, 3]],
              ),
         ),
            
          ],
        ),
              ),
      ),
    );
  }
}
