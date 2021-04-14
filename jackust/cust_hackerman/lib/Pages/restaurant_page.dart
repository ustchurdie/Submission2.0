import 'package:auto_size_text/auto_size_text.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  final String title;

  const RestaurantPage({Key key, @required this.title}) : super(key: key);

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
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemBuilder: (context, int index) {
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
                              image: AssetImage(
                                  CCTBreakfast.cctBreakfastImages[index]))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[100]),
                        onPressed: () {
                          Navigator.pushNamed(context, '/foodtemplate2', arguments: ScreenArguments(name: CCTBreakfast.cctBreakfastEngName[index]));
                        },
                        child: Text(
                          'Check It Out',
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
            );
          },
          itemCount: CCTBreakfast.cctBreakfastEngName.length,
        )

        //TODO: Add the detail of the type of restaurant e.g. what does it provides etc.
        );
  }
}
