import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  final String name;
  final int review;
  final String rating;
  final int eta;
  final Color color;

  const FoodCard(
      {Key key,
      @required this.name,
      @required this.review,
      @required this.rating,
      @required this.eta, @required this.color})
      : super(key: key);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool _liked = false;
  void _likeAction() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                      color: widget.color,
                    )),
                    Positioned(
                        bottom: 5,
                        left: 15,
                        child: CircleAvatar(
                          backgroundColor: Colors.pink[200],
                          radius: 20,
                          child: IconButton(
                              iconSize: 30.0,
                              splashRadius: 30.0,
                              icon: Icon(
                                Icons.dinner_dining,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        )),
                  ],
                )),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                      title: Text(widget.name),
                      subtitle: Text('${widget.rating}     ${widget.review} reviews'),
                      trailing: _liked
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
                            )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
