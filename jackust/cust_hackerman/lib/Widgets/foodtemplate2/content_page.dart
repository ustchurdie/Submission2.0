import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

final List<String> eggtartImages = [
  '/eggtart/1.jpg',
  '/eggtart/2.jpg',
  '/eggtart/3.jpg',
  '/eggtart/4.jpg'
];

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
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
                  'EggTart (FoodName) 蛋撻 (中文名)',
                  maxLines: 1,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ImageView(),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
            ),
            PropertyBox(title: 'Description', textbelow: 'This is the section for the description of the food. Briefly describe the taste, maybe history? of the food. Add anything you want.',),
            PropertyBox(title: 'Ingredients', textbelow: 'Anything la',),
            PropertyBox(title: 'Properties', textbelow: 'Anything la',),
            PropertyBox(title: 'Allergies', textbelow: 'Anything la',),
            PropertyBox(title: 'See Also/ Categories', textbelow: 'Anything la',),
            Divider(height: 30, thickness: 1.0,),
            Container(color: Colors.grey, height: 100, child: Center(child: Text('Contact/ Copy Right?'),),)
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
    Key key,@required this.title,@required this.textbelow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ImageView extends StatelessWidget {
  const ImageView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(eggtartImages[0]), fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(eggtartImages[1]), fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(eggtartImages[2]), fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(eggtartImages[3]), fit: BoxFit.cover)),
            ),
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
