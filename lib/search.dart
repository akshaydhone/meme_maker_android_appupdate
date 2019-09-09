import 'package:flutter/material.dart';

import 'main.dart';

class SearchPage extends StatefulWidget {
  static String tag = 'ai-page';
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String name, profession,profession1,profession2,profession3,profession4,profession5, message;

  int _index = 0;

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      //appBar: _appBar(),

        body: new Text(
          'Search Page',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
     // bottomNavigationBar: _bottemTab(),

    );


  }


  Widget _appBar() {
    return new AppBar(
      title: Row(

        children: <Widget>[

          //Icon(Icons.dehaze),
          // new Text("Novero", textAlign: TextAlign.center),


          Padding(
            padding: const EdgeInsets.only(left: 0.5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 40,
              width: 250,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(Icons.search,color: Color.fromRGBO(55, 30, 95, 1),),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Image.asset(
                      "assets/uanotif_nomessage.png",
                      color: Colors.blue,
                      width: 20,
                      height: 20,
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
      elevation: 0,

    );
  }

  Widget _bottemTab() {
    return new BottomNavigationBar(
      //currentIndex: 0,
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      type: BottomNavigationBarType.fixed,
      items: [
        new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home',style: TextStyle(color: Colors.black),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            title: Text(
              'Mall',style: TextStyle(color: Colors.black),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.folder),

            title: Text('Scan',style: TextStyle(color: Colors.black),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.local_mall),
            title: Text(
              'Shopping',style: TextStyle(color: Colors.black),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'Profile',style: TextStyle(color: Colors.black),)),
      ],);
  }
}