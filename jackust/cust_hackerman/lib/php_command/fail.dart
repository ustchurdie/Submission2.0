import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String sqlCommand = 'SELECT * FROM `food_name`';

class Food {
  final String id;
  final String name, foodDescription, imageUrl;

  Food({
    this.id,
    this.name,
    this.foodDescription,
    this.imageUrl,
  });

  factory Food.fromJson(Map<String, dynamic> jsonData) {
    return Food(
      id: jsonData['1'],
      name: jsonData['name'],
      foodDescription: jsonData['food_description'],
      imageUrl: "http://127.0.0.1/food/images/" + jsonData['image_url'],
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Food> foods;

  CustomListView(this.foods);

  Widget build(context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, int currentIndex) {
        return createViewItem(foods[currentIndex], context);
      },
    );
  }

  Widget createViewItem(Food food, BuildContext context) {
    return new ListTile(
        title: new Card(
          elevation: 5.0,
          child: new Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.orange)),
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.network(food.imageUrl),
                  padding: EdgeInsets.only(bottom: 8.0),
                ),
                Row(children: <Widget>[
                  Padding(
                      child: Text(
                        food.name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                  Text(" | "),
                  Padding(
                      child: Text(
                        food.foodDescription,
                        style: new TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.right,
                      ),
                      padding: EdgeInsets.all(1.0)),
                ]),
              ],
            ),
          ),
        ),
        onTap: () {
          //We start by creating a Page Route.
          //A MaterialPageRoute is a modal route that replaces the entire
          //screen with a platform-adaptive transition.
          var route = new MaterialPageRoute(
            builder: (BuildContext context) => new SecondScreen(value: food),
          );
          //A Navigator is a widget that manages a set of child widgets with
          //stack discipline.It allows us navigate pages.
          Navigator.of(context).push(route);
        });
  }
}

Future<List<Food>> downloadJSON() async {
  print('fucntion running');
  String phpurl = "http://127.0.0.1/get_specific.php";
  var url = Uri.parse(phpurl);
  var response = await http.post(url, body: {'index': sqlCommand});
  //change id to access the row, gender for the column name
  //print('Response status: ${response.statusCode}');
  //print('Response body: ${json.decode(response.body)}');
  int statusCode = response.statusCode;
  if (statusCode == 200) {
    print("connect successful");
    // If the API call to the server was successful, parse the course list in JSON format
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List foods = json.decode(response.body);
    return foods.map((food) => new Food.fromJson(food)).toList();
  } else {
    // If the API call was fail, throw an error.
    throw Exception(
        'Response content length is ${response.statusCode}, failed to retrieve data.');
    //print(await http.read('https://example.com/foobar.txt'));
  }
}

class SecondScreen extends StatefulWidget {
  final Food value;

  SecondScreen({Key key, this.value}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Detail Page')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: new Text(
                  'FOOD DETAILS',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                //`widget` is the current configuration. A State object's configuration
                //is the corresponding StatefulWidget instance.
                child: Image.network('${widget.value.imageUrl}'),
                padding: EdgeInsets.all(12.0),
              ),
              Padding(
                child: new Text(
                  'NAME : ${widget.value.name}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              Padding(
                child: new Text(
                  'Description : ${widget.value.foodDescription}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(20.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: new Scaffold(
        appBar: new AppBar(title: const Text('MySQL Images Text')),
        body: new Center(
          //FutureBuilder is a widget that builds itself based on the latest snapshot
          // of interaction with a Future.
          child: new FutureBuilder<List<Food>>(
            future: downloadJSON(),
            //we pass a BuildContext and an AsyncSnapshot object which is an
            //Immutable representation of the most recent interaction with
            //an asynchronous computation.
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Food> foods = snapshot.data;
                return new CustomListView(foods);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //return  a circular progress indicator.
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  print('Hello_world HaHa!');
  runApp(MyApp());
}
