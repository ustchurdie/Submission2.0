import 'package:auto_size_text/auto_size_text.dart';
import 'package:cust_hackerman/Models/foodbase.dart';
import 'package:cust_hackerman/Models/screen_arguments.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  final String name;
  final int index;

  const FoodCard(
      {Key key,
      @required this.index, this.name})
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
    return ClipRect(
      child: Container(
        height: 250,
        width: 250,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        image: DecorationImage(
                            image: AssetImage(CCTBreakfast.cctBreakfastImages[widget.index]),
                            fit: BoxFit.cover),
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
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(CCTBreakfast.cctBreakfastEngName[widget.index], maxLines: 3, textAlign: TextAlign.center,),
                          Positioned(left: 0.0,child: AutoSizeText(CCTBreakfast.cctBreakfastCanName[widget.index], maxLines: 1, textAlign: TextAlign.start,)),
                          Divider()
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           _liked
                            ? IconButton(
                              iconSize: 20,
                                icon: Icon(Icons.favorite),
                                color: Colors.red,
                                onPressed: _likeAction,
                                splashRadius: 20.0,
                              )
                            : IconButton(
                              iconSize: 20,
                                icon: Icon(Icons.favorite_border_outlined),
                                onPressed: _likeAction,
                                splashRadius: 20.0,
                              ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/foodtemplate2', arguments: ScreenArguments(name: FoodModel.title[widget.index], foodId: "generatefromthedatabase") );
                            },
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('More'),
                                  Icon(Icons.arrow_right)
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
