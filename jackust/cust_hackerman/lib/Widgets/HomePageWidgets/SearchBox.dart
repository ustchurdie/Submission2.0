import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key key,
    @required TextEditingController searchtxt,
  })  : _searchtxt = searchtxt,
        super(key: key);

  final TextEditingController _searchtxt;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: FlexibleSpaceBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              controller: widget._searchtxt,
              decoration: InputDecoration(
                  hintText: 'What kind of food are you searching?'),
              onSubmitted: (_){
                Navigator.pushNamed(context, '/shopinfo');
              },
            ),
          ),
        ),
      ),
    );
  }
}
