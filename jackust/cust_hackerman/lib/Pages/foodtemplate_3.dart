import 'package:flutter/material.dart';

class FoodTemplate3 extends StatefulWidget {
  final String foodName;
  final String foodId;

  const FoodTemplate3({Key key, @required this.foodName, this.foodId})
      : super(key: key);

  @override
  _FoodTemplate3State createState() => _FoodTemplate3State();
}

class _FoodTemplate3State extends State<FoodTemplate3> {
  bool _liked = false;

  void _likeAction() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.foodName}'),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          _liked
              ? IconButton(
                  icon: Icon(Icons.favorite),
                  color: Colors.red,
                  onPressed: _likeAction,
                  splashRadius: 20.0,
                )
              : IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: _likeAction,
                  splashRadius: 20.0,
                ),
                SizedBox(width: 40),
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Divider(height: 10, thickness: 2.0,),
            Chip(label: Text("label")),
            SizedBox(height: 50),
            Divider(height: 10, thickness: 2.0,),
            Chip(label: Text("label")),
            SizedBox(height: 50),
            Divider(height: 10, thickness: 2.0,),
            Chip(label: Text("label")),
            SizedBox(height: 50),
            
          ],
        ),
      ),
    );
  }
}
