import 'package:flutter/material.dart';

class FoodTemplate1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
      body:  Container(
                height: double.infinity,
                width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("background.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop)
            ),
          ),
          child:  SingleChildScrollView(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Container(color: Colors.red,),
                  Expanded(flex: 3,child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(color: Colors.green, height: 300, width: double.infinity,)
                    ],
                  )),
                  Expanded(flex: 7,child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(color: Colors.red, width: double.infinity , height: 100,)
                    ],
                  )),
                ],
              ),
          ),
    
        ),
    );
  }
}