import 'package:auto_size_text/auto_size_text.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:flutter/material.dart';

class FoodTemplate1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: FoodTemplateAppBar(notHome: true,),
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width *0.4,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  PropertyBox(),
                  PropertyBox(),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  PropertyBox(),
                  PropertyBox(),
                ]),
                SizedBox(height: 50,),
                Text('Categories'),
                SizedBox(height: 50,),
                Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    Chip(label: Text("Milk")),
                    Chip(label: Text("Cha Chaan Teng")),
                    Chip(label: Text("Egg")),
                    Chip(label: Text("Vegan?")),
                    Chip(label: Text("Breakfast")),
                    Chip(label: Text("Snack")),
                    Chip(label: Text("Milk")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
      width: MediaQuery.of(context).size.width*0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'title',
            minFontSize: 24,
            maxLines: 1,
            maxFontSize: 40,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Divider(),
          AutoSizeText(
            'textbelow',
            maxLines: 3,
            maxFontSize: 30,
            minFontSize: 20,
          ),
        ],
      ),
    );
  }
}
