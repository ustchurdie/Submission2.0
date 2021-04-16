import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

String sqlCommand='SELECT * FROM `food_name`';
class Foods{
  List<Food>foods;

  Foods({this.foods});

  factory Foods.fromJson(List<dynamic> parsedJson){

     List<Food> foods =[];
    foods = parsedJson.map((i)=>Food.fromJson(i)).toList();

    return Foods(
      foods: foods,
    );
  }
}
class Food{
  final String id;
  final String name;
  final String foodDescription;
  final String imageUrl;

  Food({this.id,this.name, this.foodDescription, this.imageUrl});

  factory Food.fromJson(Map<String, dynamic> json){

    return Food(
      id: json['id'] as String,
      name: json['name'] as String,
      foodDescription: json['food_description'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
  Map<String, dynamic> toJson(){
  return {
    "id": this.id,
    "name": this.name,
    "food_description": this.foodDescription,
    "image_url": this.imageUrl
  };
}
}

Future<List<Food>> downloadJSON() async {
    print('fucntion running');
    String phpurl = "http://127.0.0.1/get_specific.php";
    final url = Uri.parse(phpurl);
    final response = await http.post(url, body:{'index': sqlCommand});
    //change id to access the row, gender for the column name
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${json.decode(response.body)}');
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      print ("connect successful");
      // If the API call to the server was successful, parse the course list in JSON format
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      //List foods= json.decode(response.body);
      List foods= json.decode([{"id":"3","name":"sandwitch","foodDescription":"very yummy sandwitch","imageUrl":"sandwitch.jpg"},{"id":"2","name":"bun","foodDescription":"very yummy bun","imageUrl":"bun.jpg"},{"id":"1","name":"toast","foodDescription":"Very delicious and yummy","imageUrl":"toast.jpg"}]);
      return foods.map((food) => new Food.fromJson(food)).toList();
    } else {
      // If the API call was fail, throw an error.
      throw Exception(
          'Response content length is ${response.statusCode}, failed to retrieve data.');
    }
  }
/*void testing(){
  final List<Food>foods;
  print(this.foods);
}*/
void main() {
  print('Hello_world HaHa!');
  downloadJSON();
  //testing();
}