import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:flutter/material.dart';

class FoodTemplate2 extends StatelessWidget {
  final String title;
  final String imgPath;
  //final List<Food> foods;
FoodTemplate2({Key key, @required this.title, this.imgPath})
      : super(key: key);
FoodTemplate2.frommap(Map argument):title=argument['title'],imgPath=argument['imgPath'];
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
                flex: 8,
                child: ContentPage(
                  title: title,
                  imgPath: imgPath,
                )),
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
            Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('/drawer_background.jpeg'),
                        fit: BoxFit.cover))),
            TabBarItem(
              header: 'Breakfast',
            ),
            TabBarItem(
              header: 'Tea',
            ),
            TabBarItem(
              header: 'Main Course',
            ),
            TabBarItem(
              header: 'Ingredients',
            ),
            TabBarItem(
              header: 'Cha Chaan Teng',
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final String header;

  const TabBarItem({Key key, @required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        autofocus: true,
        onTap: () {},
        child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(113, 201, 206, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.menu), Text('$header')],
            )),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  final String title;
  final String imgPath;

  const ContentPage({Key key, @required this.title, this.imgPath})
      : super(key: key);

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
                child: Center(
                  child: AutoSizeText(
                    title,
                    maxLines: 1,
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath), fit: BoxFit.fill)),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
            ),
            PropertyBox(
              title: 'Description',
              textbelow: AutoSizeText(
                'This is the section for the description of the food. Briefly describe the taste, maybe history? of the food. Add anything you want.',
                maxLines: 3,
                maxFontSize: 30,
                minFontSize: 20,
              ),
            ),
            PropertyBox(
              title: 'Allergies',
              textbelow: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  runSpacing: 4.0,
                  spacing: 4.0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [ ActionChip(
                          backgroundColor: Colors.blue[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Cow\'s Milk?'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.blue[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Tree Nuts'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.grey[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Shellfish'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.grey[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Soy'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.grey[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Fish'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.blue[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Wheat'),
                          onPressed: () {},
                  ),
                  ActionChip(
                          backgroundColor: Colors.blue[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Eggs'),
                          onPressed: () {},
                  ),
                   ActionChip(
                          backgroundColor: Colors.blue[100],
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Peanut'),
                          onPressed: () {},
                  ),
                  ])),
            PropertyBox(
              title: 'Properties',
              textbelow: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end,children: [Text('Per 100g', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))],),
                  Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Calories: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('301  kCal', style: TextStyle(fontSize: 18))],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Protein: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('9.0  g', style: TextStyle(fontSize: 18))],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Sugars: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('0.7  g', style: TextStyle(fontSize: 18))],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Sodium: ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('1140  mg', style: TextStyle(fontSize: 18))],),
                ],
              )
            ),
            PropertyBox(
              title: 'Options',
              textbelow: AutoSizeText(
                'Puffy Pastry Eggtart / Shortcrust Pastry Eggtart',
                maxLines: 3,
                maxFontSize: 30,
                minFontSize: 20,
              ),
            ),
            PropertyBox(
              title: 'See Also/ Categories',
              textbelow: Wrap(
                direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  runSpacing: 4.0,
                  spacing: 4.0,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    ActionChip(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          label: Text('Cha Chaan Teng'),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/restaurant');
                          },
                  ),
                  ]
              ),
            ),
            Divider(
              height: 30,
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}

class PropertyBox extends StatelessWidget {
  final String title;
  final Widget textbelow;
  const PropertyBox({
    @required this.title,
    @required this.textbelow,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 8.0, right: 15.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              minFontSize: 24,
              maxLines: 1,
              maxFontSize: 40,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(),
            textbelow,
          ],
        ),
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final List<String> type;

  const ImageView({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      child: CarouselSlider(
          items: [
            for (var i in type)
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
            autoPlayAnimationDuration: Duration(milliseconds: 300),
            viewportFraction: 0.8,
          )),
    );
  }
}
