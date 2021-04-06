import 'package:flutter/material.dart';

class VerticalTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Color.fromRGBO(166, 227, 233, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Text("This is a header")),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
            TabBarItem(),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        autofocus: true,
        onTap: (){},
              child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(113, 201, 206, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex:1, child: CircleAvatar(backgroundColor: Colors.white,)),
                Expanded(flex: 5, child: Center(child: Text("This is a tab"))),
                Expanded(flex: 5, child: Center(child: Text("This is a tab"))),
              ],
            )),
      ),
    );
  }
}
