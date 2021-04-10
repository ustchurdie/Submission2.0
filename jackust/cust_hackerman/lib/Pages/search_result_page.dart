import 'dart:math';

import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:cust_hackerman/Widgets/foodtemplate2/vertical_tab_bar.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {

  static Random random = new Random();

  final String result;

  const SearchResultPage({Key key,@required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: AppBar(title: Text('Showing results of : $result'),),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 2, child: SingleChildScrollView(child: VerticalTabBar())),
            Expanded(flex: 8, child: ResultList(random: random)),
          ],
        ),
      ),
    );
  }
}

class ResultList extends StatelessWidget {
  const ResultList({
    Key key,
    @required this.random,
  }) : super(key: key);

  final Random random;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*2/3,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0
          ),
         itemBuilder: (BuildContext context, int index){
            return FoodCard(index: random.nextInt(CCTBreakfast.cctBreakfastEngName.length));
         },
         itemCount: 15,
      ),
    );
  }
}