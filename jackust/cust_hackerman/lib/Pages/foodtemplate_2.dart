import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:flutter/material.dart';

class FoodTemplate2 extends StatelessWidget {

  final String title;

  const FoodTemplate2({Key key,@required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Scaffold(
        appBar: FoodTemplateAppBar(
          notHome: true,
        ),
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
            Expanded(flex: 8, child: ContentPage(title: title,)),
          ],
        ),
      ),
    );
  }
}

class FoodTemplateAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final bool notHome;

  const FoodTemplateAppBar({this.notHome});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: notHome,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
      elevation: 5,
      backgroundColor: Color.fromRGBO(203, 241, 245, 1),
      leading: notHome
          ? IconButton(
              iconSize: kToolbarHeight * 0.5,
              color: Colors.black,
              icon: Icon(Icons.arrow_left_sharp),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,
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
    );
  }
}

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
            
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {

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
                Expanded(flex: 5, child: Center(child: Text("Restaurant type"))),
                Expanded(flex: 5, child: Center(child: Text("(Breakfast/Main COurse/Tea/Snack?)"))),
              ],
            )),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {

  final String title;

  const ContentPage({Key key,@required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(227, 253, 253, 1),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.start,
          direction: Axis.vertical,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  title + "  \n(" +CCTBreakfast.cctBreakfastCanName[CCTBreakfast.cctBreakfastEngName.indexOf(title)]+")",
                  maxLines: 2,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // ImageView(),
             Container(
                height: MediaQuery.of(context).size.height*0.45,
                width:MediaQuery.of(context).size.width*0.3 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(image: AssetImage(CCTBreakfast.cctBreakfastImages[CCTBreakfast.cctBreakfastEngName.indexOf(title)]),
                  fit: BoxFit.cover)
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
            ),
            PropertyBox(title: 'Description', textbelow: 'This is the section for the description of the food. Briefly describe the taste, maybe history? of the food. Add anything you want.',),
            PropertyBox(title: 'Allergies', textbelow: 'Put some tagchips in here',),
            PropertyBox(title: 'Properties', textbelow: 'Calories, Saturated/Trans-fat, sugar, sodium',),
            PropertyBox(title: 'Options', textbelow: 'Puffy Pastry Eggtart / Shortcrust Pastry Eggtart',),
            PropertyBox(title: 'See Also/ Categories', textbelow: 'What did other users also looked for \nUsually for (breakfast/snacks/lunch/dinner)?',),
            Divider(height: 30, thickness: 1.0,),
          ],
        ),
      ),
    );
  }
}

class PropertyBox extends StatelessWidget {

  final String title;
  final String textbelow;
  const PropertyBox({
 @required this.title,@required this.textbelow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top:8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0)
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(title, minFontSize: 24, maxLines: 1, maxFontSize: 40, style: TextStyle(fontWeight: FontWeight.bold),),
            Divider(),
            AutoSizeText(textbelow, maxLines: 3, maxFontSize: 30, minFontSize: 20,),
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: CarouselSlider(
          items: [
            for (var i in CCTBreakfast.cctBreakfastImages)
              Container(
                margin: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: AssetImage(i), fit: BoxFit.cover)),
              )
          ],
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 2,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 400),
            viewportFraction: 0.8,
          )),
    );
  }
}
