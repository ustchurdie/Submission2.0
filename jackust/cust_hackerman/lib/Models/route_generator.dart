import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:cust_hackerman/Pages/restaurant_page.dart';
import 'package:cust_hackerman/Pages/foodtemplate_1.dart';
import 'package:cust_hackerman/Pages/foodtemplate_2.dart';
import 'package:cust_hackerman/Pages/foodtemplate_3.dart';
import 'package:cust_hackerman/Pages/search_result_page.dart';
import 'package:cust_hackerman/main.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    ScreenArguments arguments = args;
   
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => NewHomePage());
      case '/foodtemplate1':
        return MaterialPageRoute(builder: (_) => FoodTemplate1());
      case '/foodtemplate2':
        return MaterialPageRoute(builder: (_) => FoodTemplate2(title: arguments.name,));
      case '/foodtemplate3':
        return MaterialPageRoute(builder: (_) => FoodTemplate3()); 
      case '/searchresult':
        return MaterialPageRoute(builder: (_) => SearchResultPage(result: arguments.name));
      case '/restaurant':
        return MaterialPageRoute(builder: (_) => RestaurantPage(title: arguments.name));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text('Error'),),
        body: Center(child: Text('ERROR'),),
      );
    });
  }
}
