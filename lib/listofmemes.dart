import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'page0.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

import 'page4.dart';
import 'page5.dart';
import 'page6.dart';
import 'page7.dart';
import 'page8.dart';



import 'page9.dart';
import 'page10.dart';
import 'page11.dart';
import 'page12.dart';
import 'page13.dart';
import 'page14.dart';


import 'package:path/src/context.dart';
import 'package:flutter/src/widgets/framework.dart';

//Define "root widget"
//void main() => runApp(new MyApp());//one-line function
//Now use stateful Widget = Widget has properties which can be changed
class MainPage extends StatefulWidget {
  final String title;
  //Custom constructor, add property : title
  @override
  MainPage({this.title}) : super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPageState();//Return a state object
  }
}
class MainPageState extends State<MainPage> {
  //State must have "build" => return Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(



      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 15.0,
        crossAxisSpacing: 15.0,
        padding: const EdgeInsets.all(
            0.0),
        children: _buildGridTiles(13),//Where is this function ?
      ),
    );
  }
}
List<Widget> _buildGridTiles(numberOfTiles) {
  List<Stack> containers = new List<Stack>.generate(numberOfTiles,
          (int index) {

        var pages=[DetailScreen(),Detail1Screen(),Detail2Screen(),Detail3Screen(),Detail4Screen(),Detail5Screen(),Detail6Screen(),Detail7Screen(),Detail8Screen(),Detail9Screen(),Detail10Screen(),Detail11Screen(),Detail12Screen(),Detail3Screen(),Detail4Screen()];
        //index = 0, 1, 2,...

        final imageName = index < 9 ?
        'assets/images/image0${index + 1}.JPG' : 'assets/images/image${index + 1}.JPG';
        return new Stack(
          alignment: const Alignment(0.0, 0.0),

          children: <Widget>[

            new Scaffold(
              body:ListView.builder(
                itemCount: imageName.length,
                itemBuilder: (context, imageName) {

                  //var title;
                  return ListTile(
                    title: new Image.asset( 'assets/images/image0${index+1}.JPG',
                      width: 90,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    // When a user taps on the ListTile, navigate to the DetailScreen.
                    // Notice that we're not only creating a DetailScreen, we're
                    // also passing the current todo through to it!
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pages[index],
                        ),
                      );
                    },
                  );
                },

              ),
            ),
          ],
        );
        /*
    return new Container(
      child: new Image.asset(
        imageName,
        fit: BoxFit.fill
      ),
    );
    */
      });
  return containers;
}
class MyListMeme extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: new MainPage(title: "GridView of Images")
    );
  }
}
