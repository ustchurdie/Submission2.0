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
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(color: Colors.purple),
          )
        ],
      ),
      drawer: Drawer(),
    );
  }
}
