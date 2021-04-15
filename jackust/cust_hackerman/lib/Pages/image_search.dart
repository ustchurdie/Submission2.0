import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as html;
import 'package:mime/mime.dart';

class FoodTemplate3 extends StatefulWidget {
  @override
  _FoodTemplate3State createState() => _FoodTemplate3State();
}

class _FoodTemplate3State extends State<FoodTemplate3> {
  final _pickedImages = <Image>[];
  String _imageInfo = '';

  Future<void> _pickImage() async {
    Image fromPicker =
        await ImagePickerWeb.getImage(outputType: ImageType.widget);
    html.File infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
        _imageInfo =
            'Name: ${infos.name}\nRelative Path : ${infos.relativePath}';
        print(_imageInfo);
        print(lookupMimeType(infos.relativePath));
      });
    }
  }

  Future<void> _getImgInfo() async {
    final infos = await ImagePickerWeb.getImageInfo;
    setState(() {
      _pickedImages.clear();
      _pickedImages
          .add(Image.memory(infos.data, semanticLabel: infos.fileName));
      _imageInfo = '${infos.toJson()}';
      print(_imageInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search by Image',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(203, 241, 245, 1),
        leading: IconButton(
          iconSize: kToolbarHeight * 0.5,
          color: Colors.black,
          icon: Icon(Icons.arrow_left_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                switchInCurve: Curves.easeIn,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: MediaQuery.of(context).size.height * 2 / 3,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:
                            _pickedImages == null ? 0 : _pickedImages.length,
                        itemBuilder: (context, index) => _pickedImages[index]),
                  ),
                ),
              ),
              ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Select Image'),
                ),
                ElevatedButton(
                  onPressed: _getImgInfo,
                  child: const Text('Get Image Info'),
                ),
              ]),
            ]),
      )),
    );
  }
}
