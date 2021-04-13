import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:flutter/material.dart';

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
            expandedHeight: MediaQuery.of(context).size.height / 2,
            pinned: true,
            floating: false,
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('background.jpg'), fit: BoxFit.cover),
                ),
                child: Text('SearchBox'))),
          
          // SliverPadding(
          //   padding: EdgeInsets.all(8.0),
          //   sliver:
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Food Type A",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Flex(direction: Axis.horizontal, children: [
                  for (int i= 0; i < CCTBreakfast.cctBreakfastImages.length; i++)
                    FoodCard(index: i, name: ' ',)
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  "Food Type B",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Flex(direction: Axis.horizontal, children: [
                  for (int i= 0; i < CCTBreakfast.cctBreakfastImages.length; i++)
                    FoodCard(index: i, name: ' ')
                ]),
              ),
            ],
          ))
        ]));
  }
}
