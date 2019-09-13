import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home.dart';
import 'categories.dart';
import 'search.dart';
import 'favorite.dart';
import 'package:flutter/services.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:meme_maker/home_feed_page.dart';
import 'package:meme_maker/ui_utils.dart';
import 'login_page.dart';
import 'accountBottomIconScreen.dart';

void main() => runApp(new MyApp());
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  int _selectedTab = 0;
  int _index = 0;
  final _pageOptions = [
    HomePage(),
    CategoriesPage(),
    SearchPage(),
    FavouritePage(),
  ];
  static const _kAddPhotoTabIndex = 2;
  int _tabSelectedIndex = 0;

  // Save the home page scrolling offset,
  // used when navigating back to the home page from another tab.
  double _lastFeedScrollOffset = 0;
  ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch(_index) {
      case 0:
        child = _buildBody();
        break;

      case 1:
        child = FlutterLogo();
        break;

      case 2:
        child= CategoriesPage();
        break;
      case 3:
        child= FlutterLogo();
        break;
      case 4:
        child=AccountBottomIconScreen();
        break;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          primaryTextTheme: TextTheme(
            title: TextStyle(color: Colors.white),

          )),
      home: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Color(0xfffd7878),
          title: Row(
            children: <Widget>[

              SizedBox(width: 12.0),
              GestureDetector(
                child: Text(
                  'MemeMaker',
                  style: TextStyle(
                      fontFamily: 'Billabong',
                      color: Colors.white,
                      fontSize: 32.0),
                ),
                //onTap: _scrollToTop,
              ),
            ],
          ),
          actions: <Widget>[

            Builder(builder: (BuildContext context) {
              return IconButton(
                color: Colors.black,
                icon: new Image.asset("assets/images/chatm.png"),
                onPressed: () => showSnackbar(context, 'My Messages'),
              );
            }
            ),
          ],
        ),
        //body:  _buildBody(),
        bottomNavigationBar: _bottemTab(),
        body: SizedBox.expand(child: child),

      ),
    );

  }

  void dispose() {
    _disposeScrollController();
    super.dispose();
  }

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  // Call this when changing the body that doesn't use a ScrollController.
  void _disposeScrollController() {
    if (_scrollController != null) {
      _lastFeedScrollOffset = _scrollController.offset;
      _scrollController.dispose();
      _scrollController = null;

    }
  }

  void _onTabTapped(BuildContext context, int index) {
    if (index == _kAddPhotoTabIndex) {
      showSnackbar(context, 'Add Photo');
    } else if (index == _tabSelectedIndex) {
      _scrollToTop();
    } else {
      setState(() => _tabSelectedIndex = index);
    }
  }


  Widget _buildBody() {
    switch (_tabSelectedIndex) {

      case 0:

        _scrollController =
            ScrollController(initialScrollOffset: _lastFeedScrollOffset);
        return HomeFeedPage(scrollController: _scrollController);
      default:
        const tabIndexToNameMap = {
          0: 'Home',
          1: 'Search',
          2: 'Add Photo',
          3: 'Notifications',
          4: 'Profile',
        };
        _disposeScrollController();
        return _buildPlaceHolderTab(tabIndexToNameMap[_tabSelectedIndex]);
    }
  }

  Widget _buildPlaceHolderTab(String tabName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          children: <Widget>[
            Text(
              'Oops, the $tabName tab is\n under construction!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
            Image.asset('assets/images/building.gif'),
          ],
        ),
      ),
    );
  }




  Widget _bottemTab() {
    return new BottomNavigationBar(
      //currentIndex: 0,
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      type: BottomNavigationBarType.fixed, backgroundColor: Color(0xfffd7878),
      items: [
        new BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.white,),
            title: Text('Home',style: TextStyle(color: Colors.white),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.explore,color: Colors.white,),
            title: Text(
              'Explore',style: TextStyle(color: Colors.white),)),

        new BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,color: Colors.white,),
            title: Text(
              'Create',style: TextStyle(color: Colors.white),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.notifications,color: Colors.white,),
            title: Text('Notify',style: TextStyle(color: Colors.white),)),
        new BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.white,),
            title: Text(
              'Me',style: TextStyle(color: Colors.white),),),
      ],
    );
  }
  Future<void> _optionsDialogBox() {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    // onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    //onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


}