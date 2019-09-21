import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meme_maker/image_picker_dialog.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerHandler {
  ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;
  ImagePickerHandler(this._listener, this._controller);


  openCamera() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    cropImage(image);

  }

  openGallery() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    cropImage(image);

    //HomePages();
    //HomePages();
  }

  void init() {
    imagePicker = new ImagePickerDialog(this, _controller);
    imagePicker.initState();

  }

  Future cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,

    );
    _listener.userImage(croppedFile);


  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);


  }
}

abstract class ImagePickerListener {
  userImage(File _image);


}

class HomePages extends StatefulWidget {
  File image;


  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  File image;
  Offset offset = Offset.zero;
  int _counter = 0;
  void _incrementCounter() {
    setState(
            () {
              _counter++;
            }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              offset = Offset(
                  offset.dx + details.delta.dx, offset.dy + details.delta.dy);
            });
          },
          child: SizedBox(
            width: 300,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white),
                  decoration: InputDecoration(
                    //Add th Hint text here.
                    hintText: "Enter Text",
                    hintStyle: TextStyle(
                        fontSize: 30.0, color: Colors.white
                    ),
                    // border: OutlineInputBorder( borderSide: BorderSide(color: Colors.red, width: 15.0)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.transparent, width: 0.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}