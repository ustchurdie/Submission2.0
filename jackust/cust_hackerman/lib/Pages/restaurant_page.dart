import 'package:auto_size_text/auto_size_text.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  //final String title;

  const RestaurantPage({Key key, /* @required  this.title*/}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(227, 253, 253, 1),
      appBar: AppBar(
        leading: IconButton(
          iconSize: kToolbarHeight * 0.5,
          color: Colors.black,
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
            minWidth: 100,
            child: Text('Home'),
          ),
          Container(color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
          MaterialButton(
            onPressed: () {},
            minWidth: 100,
            child: Text('Browse by Categories'),
          ),
          Container(color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
          MaterialButton(
            onPressed: () {},
            minWidth: 100,
            child: Text('Edit the Fictionary'),
          ),
          Container(color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
          MaterialButton(
            onPressed: () {},
            minWidth: 100,
            child: Text('Contact Us'),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        height: MediaQuery.of(context).size.height - 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[100].withOpacity(0.8),
          // gradient: LinearGradient(
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.bottomRight,
          //     colors: [Colors.white, Colors.black54]
          //     )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Cha Chaan Teng (茶餐廳)',
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TypeBox(
                  type: 'Breakfast',
                  imgPath: CCTBreakfast.cctBreakfastImages,
                ),
                TypeBox(
                  type: 'Tea',
                  imgPath: CCTTea.cctteaImages,
                ),
                TypeBox(
                  type: 'Main Course',
                  imgPath: CCTMainCourse.cctmainImages,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TypeBox extends StatelessWidget {
  final String type;
  final List<String> imgPath;
  const TypeBox({Key key, @required this.type, @required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.height * 0.533,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow[50].withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ImageView(type: imgPath),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/foodlist', arguments: ScreenArguments(name: type));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.5)
                          ])),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                  '$type',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RestaurantType extends StatelessWidget {
  final int index;
  const RestaurantType({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color.fromRGBO(120, 190, 190, 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(CCTBreakfast.cctBreakfastEngName[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(CCTBreakfast.cctBreakfastImages[index]))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.yellow[100]),
                onPressed: () {
                  Navigator.pushNamed(context, '/foodtemplate2',
                      arguments: ScreenArguments(
                          name: CCTBreakfast.cctBreakfastEngName[index]));
                },
                child: Text(
                  'Check It Out',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
