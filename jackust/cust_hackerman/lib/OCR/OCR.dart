import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Post {
  final String apikey="3bba314eb988957";
  final String base64Image;
  final String language="cht";

  Post({this.base64Image});


  Map toMap() {
    var map = new Map();
    map["apikey"] = apikey;
    map["base64Image"] = base64Image;
    map["language"] = language;

    return map;
  }
}

class Res{
  final PR ParsedResults;
  final int OCRExitCode;
  //final dynamic ParsedText;
  Res({this.ParsedResults,this.OCRExitCode});

  factory Res.fromJson(Map json) {
    return Res(
      ParsedResults: PR.fromJson(json['ParsedResults'][0]),
      OCRExitCode: json['OCRExitCode']
    );
  }
}

class PR{
  final String ParsedText;
  PR({this.ParsedText});
  factory PR.fromJson(dynamic parsedjson){
    return PR(ParsedText:parsedjson['ParsedText']);
  }
}

Future<String> createPost({Map body}) async {
  var url="https://api.ocr.space/parse/image";
  return http.post(Uri.parse(url), body: body).then((http.Response response) {
     final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    Map<String,dynamic>map=json.decode(response.body);
    //print(response.body);
    Res r=Res.fromJson(map);
    if(r.OCRExitCode!=1){
      print("Error Occurred. Please Try Again.");
      return null;
    }
    print("Text recognized:");
    print(r.ParsedResults.ParsedText);
    return r.ParsedResults.ParsedText;

  });
}