import 'package:cust_hackerman/Widgets/foodtemplate2/content_page.dart';
import 'package:cust_hackerman/Widgets/foodtemplate2/vertical_tab_bar.dart';
import 'package:flutter/material.dart';

class FoodTemplate2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [Colors.green, Colors.deepOrange]),
      // ),
      child: Scaffold(
        appBar: AppBar(),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: VerticalTabBar()),
              ),
              Expanded(
                flex: 8,
                child: ContentPage()
              ),
            ],
          ),
        ),
    );
  }
}
