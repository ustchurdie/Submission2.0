import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:convert';
import '../OCR/OCR.dart';
import 'package:mime/mime.dart';
import '../Search/Search.dart';
import '../Models/screen_arguments.dart';

class FoodTemplate3 extends StatefulWidget {
  @override
  _FoodTemplate3State createState() => _FoodTemplate3State();
}

class _FoodTemplate3State extends State<FoodTemplate3> {
  final _pickedImages = <Image>[];
  String _imageInfo = '';

  Future<SearchRes> _pickImage() async {
    Uint8List infos =
    await ImagePickerWeb.getImage(outputType: ImageType.bytes);
    Image fromPicker=new Image.memory(infos);
    if (fromPicker != null) {
      setState(() {
        _pickedImages.clear();
        _pickedImages.add(fromPicker);
      });

      String b64="data:image/jpeg;base64,"+base64.encode(infos);
      print(b64);
      Post newPost=new Post(base64Image:b64);
      var p = await createPost(
          body: newPost.toMap());
      if(p==null)return null;
      return Search('Chinese',p);
    }
    return null;
  }

  Future<void> _getImgFile() async {

    setState(() {
    });
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
        title: const Text('Search by Image',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                      onPressed: ()async{
                        SearchRes res=await _pickImage();
                        if(res!=null){Navigator.pushNamed(context, res.path,
                            arguments: ScreenArguments(
                                anything:res.argument));}},
                      child: const Text('Select Image'),
                    ),
                  ]),
                ]),
          )),
    );
  }
}
