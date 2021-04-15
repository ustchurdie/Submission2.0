import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/main.dart';
import 'package:flutter/material.dart';

class FoodList extends StatelessWidget {
  final String type;

  const FoodList({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          elevation: 5,
          backgroundColor: Color.fromRGBO(203, 241, 245, 1),
          leading: IconButton(
            iconSize: kToolbarHeight * 0.5,
            color: Colors.black,
            icon: Icon(Icons.arrow_left_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/home');
              },
              minWidth: 100,
              child: Text('Home'),
            ),
            Container(
                color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
            MaterialButton(
              onPressed: () {},
              minWidth: 100,
              child: Text('Browse by Categories'),
            ),
            Container(
                color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
            MaterialButton(
              onPressed: () {},
              minWidth: 100,
              child: Text('Edit the Fictionary'),
            ),
            Container(
                color: Colors.grey, height: kToolbarHeight * 0.8, width: 1),
            MaterialButton(
              onPressed: () {},
              minWidth: 100,
              child: Text('Contact Us'),
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height - 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[100].withOpacity(0.8),
            ),
            child: SingleChildScrollView(
                          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Center(
                      child: Text(
                        type,
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.76,
                    width: double.infinity,
                    child: ListView.builder(
                      padding: EdgeInsets.all(4.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: (type == 'Tea')
                            ? CCTTea.cctteaEngName.length
                            : (type == 'Breakfast')
                                ? CCTBreakfast.cctBreakfastEngName.length
                                : CCTMainCourse.cctmainEngName.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: makeItem(
                                type: ['Cha Chaan Teng'],
                                context: context,
                                height: MediaQuery.of(context).size.height * 0.75,
                                width: MediaQuery.of(context).size.width * 0.225,
                                title: (type == 'Tea')
                                    ? CCTTea.cctteaEngName[index]
                                    : (type == 'Breakfast')
                                        ? CCTBreakfast.cctBreakfastEngName[index]
                                        : CCTMainCourse.cctmainEngName[index],
                                imgTitle: (type == 'Tea')
                                    ? CCTTea.cctteaImages[index]
                                    : (type == 'Breakfast')
                                        ? CCTBreakfast.cctBreakfastImages[index]
                                        : CCTMainCourse.cctmainImages[index],
                                description:
                                    "This is nothing but a fake description of the food the restautant is presenting."),
                          );
                        }),
                  )
                ]),
            ),
            ));
  }
}
