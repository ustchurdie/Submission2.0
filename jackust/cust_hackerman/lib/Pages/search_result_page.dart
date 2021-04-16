import 'dart:math';

import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  static Random random = new Random();

  dynamic argument;
  var commentWidgets=List<Widget>.empty(growable: true);
SearchResultPage({this.argument}){
  for(int i=0;i<argument.length;i++){
    var tb=TextButton(onPressed: (){}, child: Text(argument[i][0]));
    commentWidgets.add(tb);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Search Result',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        leading: IconButton(
          iconSize: kToolbarHeight * 0.5,
          color: Colors.black,
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:commentWidgets),
    );
  }
}
