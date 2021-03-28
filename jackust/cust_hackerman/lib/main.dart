import 'package:cust_hackerman/Models/route_generator.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyWeb());
}

class MyWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          initialRoute: '/shopinfo',
          onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

