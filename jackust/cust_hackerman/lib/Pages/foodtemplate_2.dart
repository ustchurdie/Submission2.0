import 'package:cust_hackerman/Widgets/foodtemplate2/content_page.dart';
import 'package:cust_hackerman/Widgets/foodtemplate2/vertical_tab_bar.dart';
import 'package:flutter/material.dart';

class FoodTemplate2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: FoodTemplateAppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: VerticalTabBar()),
            ),
            Expanded(flex: 8, child: ContentPage()),
          ],
        ),
      ),
    );
  }
}

class FoodTemplateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const FoodTemplateAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
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
            onPressed: (){
              Navigator.popAndPushNamed(context, '/home');
            },
            minWidth: 100,
            child: Text('Home'),
            ),
             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Browse by Categories'),
            ),
             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Edit the Fictionary'),
            ),

             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Contact Us'),
            ),

        ],
    );
  }
}
