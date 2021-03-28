import 'package:cust_hackerman/Pages/home_page.dart';
import 'package:cust_hackerman/Pages/login_page.dart';
import 'package:cust_hackerman/Pages/register_page.dart';
import 'package:cust_hackerman/Pages/shop_detail.dart';
import 'package:cust_hackerman/Pages/shop_info.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/shopinfo':
        return MaterialPageRoute(builder: (_) => ShopInfo());
      case '/shopdetail':
        return MaterialPageRoute(builder: (_) => ShopDetail()); 
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
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
