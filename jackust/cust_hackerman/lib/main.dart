import 'package:cust_hackerman/Models/route_generator.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:cust_hackerman/Widgets/HomePageWidgets/SearchBox.dart';
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
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class NewHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: FoodTemplateAppBar(
      //   notHome: false,
      // ),
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
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
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "What kind of food do you want to search?",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
            color:Color.fromRGBO(200, 221, 220, 1),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal:18.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                makeItem(
                  type: ['Snack'],
                  context: context,
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width*0.225,
                    title: "Hamburger",
                    imgTitle: 'hamburger.jpg',
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                        makeItem(
                          type: ['Snack','Breakfast'],
                          context: context,
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width*0.225,
                    title: "Ham and chopped egg salad sandwich",
                    imgTitle: '/cctbreakfast/1.jpg',
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                        makeItem(
                          type: ['Snack','Tea'],
                          context: context,
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width*0.225,
                    title: "Toasted bun served with condensed milk",
                    imgTitle: '/cctbreakfast/2.jpg',
                    description:
                        "This is nothing but a fake description of the food the restautant is presenting."),
                        makeItem(
                          context: context,
                    height: MediaQuery.of(context).size.height*0.6,
                    width: MediaQuery.of(context).size.width*0.225,
                    title: "Toasted bun served with cheese and tuna",
                    imgTitle: '/cctbreakfast/3.jfif',
                    type: ['Cha Chaan Tan', 'Breakfast'],
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


Widget makeItem({context,title, imgTitle, height, width, description,@required List<String> type}) {
  return Container(
      padding: EdgeInsets.all(8.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Color.fromRGBO(113, 142, 145, 1), borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //Container for the picture
        Container(
          height: height * 0.45,
          width: width * 0.95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imgTitle),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.2),
                ])),
          ),
        ),
        Center(child: Text('$title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
        Divider(),
        Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runSpacing: 4.0,
          spacing: 4.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: type.map((e) => ActionChip(materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,label: Text(e), onPressed: (){})).toList()
            //for the category of the food create x chip
        ),
        Divider(),
        //Container for the description
        Container(
          child: Text('$description'),
        ),
        Divider(),
        ElevatedButton.icon(
          onPressed: (){Navigator.pushNamed(context, '/foodtemplate2');}, 
          icon: Icon(Icons.arrow_downward), 
          label: Text('More'))
      ]),
  );
}
