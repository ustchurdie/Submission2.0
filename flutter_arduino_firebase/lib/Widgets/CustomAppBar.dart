import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  CustomAppBar(
      {@required this.child,
      @required this.onPressed,
      @required this.title,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(70.0);

  TextEditingController _txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
                tag: 'topBarBtn',
                child: Card(
                  elevation: 10,
                  shape: kBackButtonShape,
                  child: MaterialButton(
                    height: 70,
                    minWidth: 70,
                    elevation: 10,
                    shape: kBackButtonShape,
                    onPressed: onPressed,
                    child: child,
                  ),
                )),
            // Container(
            //   width: MediaQuery.of(context).size.width/4,
            //   margin: EdgeInsets.all(4.0),
            //   padding: EdgeInsets.all(5.0),
            //   child: TextField(
            //     controller: _txt,
            //   ),
            // ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/info');
                },
                child: Text('Button 1')),
            Hero(
              tag: 'title',
              transitionOnUserGestures: true,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20), 
                )),
                child: InkWell(
                  onTap: onTitleTapped,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}

ShapeBorder kBackButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
  ),
);

Widget kBackBtn = Icon(
  Icons.arrow_back_ios,
  // color: Colors.black54,
);
