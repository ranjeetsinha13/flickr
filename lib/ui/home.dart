import 'package:flickr/repository/movies_api.dart';
import 'package:flickr/ui/movies_list.dart';
import 'package:flickr/utils/constants.dart';
import 'package:flickr/utils/theme.dart';
import 'package:flutter/material.dart';
import '../utils/theme.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    UpcomingMoviesList(movieListKeys[0]),
    TopRatedMoviesList(movieListKeys[1]),
    PopularMoviesList(movieListKeys[2]),
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(APP_TITLE),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              tooltip: 'Search',
              icon: Icon(Icons.search),
              onPressed: () {
                // ignore: unnecessary_statements
              },
            ),
          ],
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          // this will be set when a new tab is tapped
          type: BottomNavigationBarType.fixed,
          items: new List.generate(
            tabs.length,
            (index) => setBottomNavBar(
                tabs.keys.elementAt(index), tabs.values.elementAt(index)),
          ),
        ));
  }

  BottomNavigationBarItem setBottomNavBar(String title, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      title: new Text(title, style: appThemeData.textTheme.title),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
