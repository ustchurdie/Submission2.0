import 'package:http/http.dart' as http;
import 'dart:convert';


Future<void> pass_info(String sql_command, String info) async {
    var client = http.Client();
    print('fucntion running');
    String phpurl = "http://127.0.0.1/get_specific.php";
    var url = Uri.parse(phpurl);
    var response = await http.post(url, body: {'index': sql_command, 'column': info});
    //change id to access the row, gender for the column name
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${json.decode(response.body)}');
    int statusCode = response.statusCode;
    if (statusCode == 200) {
      print ("connect successful");
      // If the API call to the server was successful, parse the course list in JSON format
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      // If the API call was fail, throw an error.
      print(
          'Response content length is ${response.statusCode}, failed to get today courses.');
      //print(await http.read('https://example.com/foobar.txt'));
    }
  }
// void main() {
//   print('Hello_world HaHa!');
//   pass_info('1', 'gender');
// }
