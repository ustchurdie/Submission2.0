import 'package:cust_hackerman/Widgets/FoodCardScrollBar/FoodCard.dart';
import 'package:cust_hackerman/Widgets/HomePageWidgets/SearchBox.dart';
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
                child: Positioned(top: 150, child: SearchBox())),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.all(8.0),
          //   sliver:
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flex(direction: Axis.horizontal, 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children :[
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        Navigator.pushNamed(context, '/foodtemplate1');
                      },
                      color: Colors.deepOrange,
                      child: Text('Template 1'),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        Navigator.pushNamed(context, '/foodtemplate2');
                      },
                      color: Colors.deepOrange,
                      child: Text('Template 2'),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        Navigator.pushNamed(context, '/shopinfo');
                      },
                      color: Colors.deepOrange,
                      child: Text('Shop Info')),
                      MaterialButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        Navigator.pushNamed(context, '/shopdetail');
                      },
                      color: Colors.deepOrange,
                      child: Text('Shop Detail')),
                  ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text("Food Type A", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
              ),
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
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text("Food Type B", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),),
              ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                                  child: Flex(direction: Axis.horizontal, children :[
                  FoodCard(review: 50, rating: "4.8", index: 0),
                  FoodCard(review: 50, rating: "4.8", index: 1),
                  FoodCard(review: 50, rating: "4.8", index: 2),
                  FoodCard(review: 50, rating: "4.8", index: 1),
                  FoodCard(review: 50, rating: "4.8", index: 2),
                  FoodCard(review: 50, rating: "4.8", index: 0),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  FoodCard(review: 50, rating: "4.8", index: 3),
                  ]),
                ),
                
            ],
          ))
        ]));
  }
}
