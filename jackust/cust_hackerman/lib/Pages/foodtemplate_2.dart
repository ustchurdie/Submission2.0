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
        appBar: FoodTemplateAppBar(notHome: true,),
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

      final bool notHome;

  const FoodTemplateAppBar({
    Key key, @required this.notHome
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: notHome,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
        elevation: 5,
        backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        leading: notHome ? IconButton(
          iconSize: kToolbarHeight * 0.5,
          color: Colors.black,
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ) : null,
        actions: [
          MaterialButton(
            onPressed: (){
              Navigator.popAndPushNamed(context, '/home');
            },
            minWidth: 100,
            child: Text('Home'),
            ),
            Container(color: Colors.grey,height: kToolbarHeight*0.8, width: 1),
             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Browse by Categories'),
            ),
            Container(color: Colors.grey,height: kToolbarHeight*0.8, width: 1),
             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Edit the Fictionary'),
            ),
Container(color: Colors.grey,height: kToolbarHeight*0.8, width: 1),
             MaterialButton(
            onPressed: (){},
            minWidth: 100,
            child: Text('Contact Us'),
            ),

        ],
    );
  }
}
