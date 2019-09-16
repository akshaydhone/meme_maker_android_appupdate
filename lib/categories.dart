import 'package:flutter/material.dart';

import 'main.dart';
import 'uploadpost.dart';

class CategoriesPage extends StatefulWidget {
  static String tag = 'ai-page';
  @override
  _CategoriesState createState() => new _CategoriesState();

}

class _CategoriesState extends State<CategoriesPage> {
  String name, profession,profession1,profession2,profession3,profession4,profession5, message;

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/your_acc.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),


      child:

      FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: Color(0xffD3D3D3),
        icon: Icon(Icons.photo_library,size: 25,), //`Icon` to display
        label: Text('Upload a Post', style: TextStyle(color: Colors.black,fontSize: 20),), //`Text` to display
        padding: EdgeInsets.all(15),

        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new UploadStateScreen();
          }));
        },
      ),
    );

    final layout = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: Color(0xffD3D3D3),
        icon: Icon(Icons.grid_on,size: 25,), //`Icon` to display
        label: Text('Upload a Layout', style: TextStyle(color: Colors.black,fontSize: 20),), //`Text` to display
        padding: EdgeInsets.all(15),
        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          //...
        },
      ),

    );



    final video = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        color: Color(0xffD3D3D3),
        icon: Icon(Icons.video_library,size: 25,), //`Icon` to display
        padding: EdgeInsets.all(15),
        label: Text('Upload a Video', style: TextStyle(color: Colors.black,fontSize: 20),), //`Text` to display
        onPressed: () {
          //Code to execute when Floating Action Button is clicked
          //...
        },
      ),
    );


    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 14.0, right: 24.0,top: 0,bottom: 200),

          children: <Widget>[
            //logo,
            //SizedBox(height: 48.0),
            //email,
            //SizedBox(height: 8.0),
           // password,
            //SizedBox(height: 24.0),
            loginButton,
            SizedBox(height: 24.0,),
            layout,
            SizedBox(height: 24.0),
            video,
            SizedBox(height: 24.0),
            //forgotLabel
          ],
        ),
      ),
    );
  }
}