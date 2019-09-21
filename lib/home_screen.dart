import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meme_maker/image_picker_handler.dart';
import 'package:meme_maker/image_picker_dialog.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin,ImagePickerListener{

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  int _counter = 0;
  void _incrementCounter() {
    setState(
            () {
          // This call to setState tells the Flutter framework that something has
          // changed in this State, which causes it to rerun the build method below
          // so that the display can reflect the updated values. If we changed
          // _counter without calling setState(), then the build method would not be
          // called again, and so nothing would appear to happen.
          _counter++;
        });
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    imagePicker=new ImagePickerHandler(this,_controller);
    imagePicker.init();


  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title,
        style: new TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body: new GestureDetector(
        onTap: () => imagePicker.showDialog(context),
        child: new Center(

          child: _image == null
              ? new Stack(
                  children: <Widget>[
                    new Center(
                      child: new CircleAvatar(
                        radius: 80.0,
                        backgroundColor: const Color(0xFF778899),
                      ),
                    ),
                    new Center(
                      child: new Image.asset("assets/images/photo_camera.png"),
                    ),

                  ],
                )
              :new Stack(
            children: <Widget>[

              new Container(
                height: 500.0,
                width: 500.0,
                decoration: new BoxDecoration(
                  color: const Color(0xff7c94b6
                  ),

                  image: new DecorationImage(
                    image: new ExactAssetImage(_image.path),
                    fit: BoxFit.cover,
                  ),
                  border:
                  Border.all(
                      color: Colors.lightBlueAccent, width: 5.0
                  ),
                  borderRadius:
                  new BorderRadius.all(
                      const Radius.circular(10.0)
                  ),
                ),
              ),
             HomePages()
            ],
          )
        ),

      ),

    );

  }

  @override
  userImage(File _image) {
    setState(() {
      this._image = _image;
    //HomePages();
    }
    );
  }


}











class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  Offset offset = Offset.zero;

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


