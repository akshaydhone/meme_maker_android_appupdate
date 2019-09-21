import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'home_screen.dart';
import 'image_picker_dialog.dart';
import 'image_picker_handler.dart';
import 'categories.dart';
import 'page0.dart';

class UploadStateScreen extends StatefulWidget {
  static String tag = 'upload-page';
  @override
  _UploadState createState() =>
      _UploadState();
}

class _UploadState extends State<UploadStateScreen> {

  File image;

//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20
  picker() async {
    //Code to execute when Floating Action Button is clicked
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new HomeScreen(title: 'Select Image');
    }
    )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(

        children: <Widget>[
          _appBar(),
          //_profile(),
          //_centerButtons(),
          _displayImages(),
          _floatingbutton(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return new Container(
      color: Color(0xfffd7878),
      padding: new EdgeInsets.only(top: 25.0),
      child: new Column(
        children: <Widget>[
          new Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(width: 12.0),

            ],
          ),

        ],
      ),
    );
  }




  Widget _floatingbutton() {
    return new Container(

      //padding: new EdgeInsets.only(top: 25.0),
      child: new Column(
        children: <Widget>[
          new Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

  FloatingActionButton(
                //onPressed: _incrementCounter,
    onPressed: picker,
                tooltip: 'Increment',
                child: Icon(Icons.camera_alt),
              ),
              //SizedBox(width: 12.0),

            ],
          ),

        ],
      ),
    );
  }

  Widget _post() {
    return new GestureDetector(
      child: new Column(
        children: <Widget>[
          new Text(
            "72",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 3.0),
            child: new Text(
              "posts",
              style: new TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _followers() {
    return new Container(
      margin: new EdgeInsets.only(left: 10.0),
      child: new GestureDetector(
        child: new Column(
          children: <Widget>[
            new Text(
              "352",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 3.0),
              child: new Text(
                "followers",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _following() {
    return new Container(
      margin: new EdgeInsets.only(left: 10.0),
      child: new GestureDetector(
        child: new Column(
          children: <Widget>[
            new Text(
              "580",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 3.0),
              child: new Text(
                "following",
                style: new TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return new Container(
      height: 150.0,
      margin: new EdgeInsets.only(top: 5.0),
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Image.asset(
                    "assets/images/your_acc.png",
                    height: 100.0,
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
                    alignment: Alignment.bottomLeft,
                    child: new Text(
                      "DisplayName",
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              new Container(
                margin: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Row(
                        children: <Widget>[_post(), _followers(), _following()],
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.0),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5.0))),
                        margin: EdgeInsets.only(top: 7.0),
                        height: 30.0,
                        width: 200.0,
                        child: new Text(
                          "Edit Profile",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      onTap: () {

                      },
                    ),
                  ],
                ),
              )
            ],
          ),
          new Container(
            margin: new EdgeInsets.only(top: 10.0),
            height: 0.5,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget _centerButtons() {
    return Container(
      child: new Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.grid_on,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: new Icon(
                    Icons.crop_original,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: new Icon(
                    Icons.perm_contact_calendar,
                    size: 30.0,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: new Icon(
                    Icons.bookmark_border,
                    size: 30.0,
                  ),
                  onPressed: () {
                  }
                  ),
            ],
          ),
          new Container(
            height: 0.5,
            color: Colors.grey[300],
          )
        ],
      ),
    );
  }
  var pages=[DetailScreen()];
  Widget _displayImages() {
    return Flexible(
        child: new Container(
          child: new GridView.builder(
              itemCount: 16,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                  margin: EdgeInsets.all(2.0),
                  color: Colors.grey,
                  child: new Image.asset("assets/images/pic$index.png"),
                );
              }

          ),

        )
    );
  }





}
