import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Models/route_generator.dart';
import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWeb());
}

class MyWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/restaurant',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class NewHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final Random random = new Random();

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('background.jpg'), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.2),
              ])),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Center(
                    child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText:
                                "What kind of food do you want to search?",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20)),
                        onSubmitted: (String value) {
                          Navigator.pushNamed(context, '/searchresult',
                              arguments: ScreenArguments(
                                  foodId: _controller.text,
                                  name: (value.contains(RegExp(
                                          '[\u4E00-\u9FEF]',
                                          unicode: true)))
                                      ? '中文'
                                      : 'English'));
                          _controller.clear();
                        }),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Can't read the menu? Try \"Search by Image!\"",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/foodtemplate3');
                          },
                          child: Text('Search by Image')),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ]),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Colors.grey[350]),
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.symmetric(horizontal: 20),
          //   child: Text('Need some suggestions? Here are some for you.'),
          // ),
          // Divider(),
          Container(
            color: Color.fromRGBO(200, 221, 220, 1),
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                makeItem(
                    type: ['Breakfast','Cha Chaan Teng'],
                    context: context,
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.225,
                    title: CCTBreakfast.cctBreakfastEngName[7],
                    imgTitle: CCTBreakfast.cctBreakfastImages[7],
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                makeItem(
                    type: ['Main Course','Cha Chaan Teng'],
                    context: context,
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.225,
                    title: CCTMainCourse.cctmainEngName[7],
                    imgTitle: CCTMainCourse.cctmainImages[7],
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                makeItem(
                    type: ['Snack', 'Tea','Cha Chaan Teng'],
                    context: context,
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.225,
                    title: CCTTea.cctteaEngName[7],
                    imgTitle: CCTTea.cctteaImages[7],
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                makeItem(
                    context: context,
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: MediaQuery.of(context).size.width * 0.225,
                    title: CCTBreakfast.cctBreakfastEngName[3],
                    imgTitle: CCTBreakfast.cctBreakfastImages[3],
                    type: ['Cha Chaan Teng', 'Breakfast'],
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget makeItem(
    {context,
    title,
    imgTitle,
    height,
    width,
    description,
    @required List<String> type}) {
  return Container(
    padding: EdgeInsets.all(8.0),
    height: height,
    width: width,
    decoration: BoxDecoration(
        color: Color.fromRGBO(100, 162, 185, 1),
        borderRadius: BorderRadius.circular(10)),
    child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      //Container for the picture
      Container(
        height: width * 0.85,
        width: width * 0.95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imgTitle),
              fit: BoxFit.fill,
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.05),
              ])),
        ),
      ),
      Center(
        child: AutoSizeText(
          '$title',
          maxLines: 2,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Divider(),
      Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runSpacing: 4.0,
          spacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: type
              .map((e) => ActionChip(
                  backgroundColor: Colors.blue[100],
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  label: Text(e),
                  onPressed: () {
                    Navigator.pushNamed(context, '/restaurant',
                        arguments: ScreenArguments(name: e));
                  }))
              .toList()
          //for the category of the food create x chip
          ),
      Divider(),
      //Container for the description
      Container(
        child: AutoSizeText(
          '$description',
          maxLines: 2,
        ),
      ),

      Divider(),
      ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, '/foodtemplate2',
                arguments: ScreenArguments(name: title, foodId: imgTitle
                ));
          },
          icon: Icon(Icons.arrow_downward),
          label: Text('More'))
    ]),
  );
}
