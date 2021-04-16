import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

String sqlCommand = 'SELECT * FROM `food_name`';

class Foods {
  List<Food> foods;

  Foods({this.foods});

  factory Foods.fromJson(List<dynamic> parsedJson) {
    List<Food> foods = [];
    foods = parsedJson.map((i) => Food.fromJson(i)).toList();

    return Foods(
      foods: foods,
    );
  }
}

class Food {
  final String id;
  final String name;
  final String foodDescription;
  final String imageUrl;

  Food({this.id, this.name, this.foodDescription, this.imageUrl});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      foodDescription: json['food_description'],
      imageUrl: json['image_url'],
    );
  }
}

List<Food> parseFood(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Food>((json) => Food.fromJson(json)).toList();
}

Future<List<Food>> downloadJSON() async {
  print('fucntion running');
  String phpurl = "http://127.0.0.1/get_specific.php";
  final url = Uri.parse(phpurl);
  final response = await http.post(url, body: {'index': sqlCommand});
  //change id to access the row, gender for the column name
  print('Response status: ${response.statusCode}');
  //print('Response body: ${json.decode(response.body)}');
  int statusCode = response.statusCode;
  if (statusCode == 200) {
    print("connect successful");
    List<dynamic> body = jsonDecode(response.body);
    print(body[0]);
    List<Food> food = body.map((dynamic e) => Food.fromJson(e)).toList();
    print(food);
    return food;
  } else {
    // If the API call was fail, throw an error.
    throw Exception(
        'Response content length is ${response.statusCode}, failed to retrieve data.');
    // If the API call to the server was successful, parse the course list in JSON format
    //List foods= json.decode(response.body);
    //print(response.body);
  }
}

/*void testing(){
  final List<Food>foods;
  print(this.foods);
}*/
void main() {
  print('Hello_world HaHa!');
  downloadJSON();
  //print(Food());
  //testing();
  //print(food.name);
}
