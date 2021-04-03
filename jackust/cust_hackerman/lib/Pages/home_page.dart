import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:cust_hackerman/Widgets/HomePageWidgets/SearchBox.dart';
import 'package:flutter/material.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodGrid.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            automaticallyImplyLeading: false,
            iconTheme: IconThemeData(
              color: Colors.green,
            ),
            backgroundColor: Colors.blue,
            expandedHeight: MediaQuery.of(context).size.height / 2,
            pinned: true,
            floating: false,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('background.jpg'), fit: BoxFit.cover),
                ),
                child: SearchBox()),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.all(8.0),
          //   sliver:
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Text("Food Type A"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                              child: Flex(direction: Axis.horizontal, children :[
                  FoodCard(review: 50, rating: "4.8", index: 2),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  ]),
              ),
              Text("Food Type B"),
                Flex(direction: Axis.horizontal, children :[
                FoodCard(review: 50, rating: "4.8", index: 3),
                FoodCard(review: 50, rating: "4.8", index: 1),
                FoodCard(review: 50, rating: "4.8", index: 3),
                FoodCard(review: 50, rating: "4.8", index: 3),
                ]),
                Flex(direction: Axis.horizontal, children :[
                FoodCard(review: 50, rating: "4.8", index: 3),
                FoodCard(review: 50, rating: "4.8", index: 3),
                FoodCard(review: 50, rating: "4.8", index: 3),
                FoodCard(review: 50, rating: "4.8", index: 3),
                ]),
            ],
          ))
        ]));
  }
}
