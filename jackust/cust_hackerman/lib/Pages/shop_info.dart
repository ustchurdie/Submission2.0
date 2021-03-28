import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodGrid.dart';
import 'package:cust_hackerman/Widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ShopInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          FoodBar(),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Text('Food Style: \n TakeAway? \n Vegan? \n Available Seats:'),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.purple,
            child: Text('Shop Location: \n Opening Hours:'),
            ),
          )
        ],
      ),
    );
  }
}
