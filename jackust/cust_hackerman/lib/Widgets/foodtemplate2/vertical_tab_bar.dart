import 'package:flutter/material.dart';

class VerticalTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.yellow[100]]
        )
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8.0), child: Container(height: 150, width: double.infinity,color: Color.fromRGBO(200, 100, 50, 0.5), child: Text('asd'),),),
            Padding(padding: EdgeInsets.all(8.0), child: Container(height: 150, width: double.infinity,color: Colors.red, child: Text('asd'),),),
            Padding(padding: EdgeInsets.all(8.0), child: Container(height: 150, width: double.infinity,color: Colors.red, child: Text('asd'),),),
            Padding(padding: EdgeInsets.all(8.0), child: Container(height: 150, width: double.infinity,color: Colors.red, child: Text('asd'),),)
          ],
        ),
      ),
    );
  }
}
