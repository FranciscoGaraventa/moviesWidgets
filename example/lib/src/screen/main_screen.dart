import 'package:flutter/material.dart';
import '../models/widget_route.dart';
import '../resources/routes.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<WidgetRoute> _widgetList;

  List<WidgetRoute> _generateRoutes() {
    List<WidgetRoute> _routeList = [];
    _routeList.add(WidgetRoute(title: 'MOVIES GENRES', route: genresGridView));
    _routeList.add(WidgetRoute(title: 'GENRES LIST', route: genresList));
    _routeList.add(WidgetRoute(title: 'INDIVIDUAL GENRE', route: individualGenre));
    _routeList.add(WidgetRoute(title: 'MOVIE BACKDROP IMAGE', route: movieBackdrop));
    _routeList.add(WidgetRoute(title: 'MOVIE CARD', route: movieCard));
    _routeList.add(WidgetRoute(title: 'GRIDVIEW OF MOVIE CARDS', route: moviesGridView));
    _routeList.add(WidgetRoute(title: 'MOVIE: RATING, RELEASE DATE, LANGUAGE', route: movieRatingReleaseDateLang));
    _routeList.add(WidgetRoute(title: 'MOVIE OVERVIEW', route: movieOverview));
    _routeList.add(WidgetRoute(title: 'MOVIE EVENTS', route: movieEvents));
    return _routeList;
  }

  @override
  void initState() {
    super.initState();
    _widgetList = _generateRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: _widgetList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blue.shade300,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _widgetList[index].title,
                      key: Key(_widgetList[index].title),
                    ),
                    ElevatedButton(
                      key: Key("widgetButtonInfo_" + "$index"),
                      onPressed: () {
                        Navigator.pushNamed(context, _widgetList[index].route, arguments: _widgetList[index].title);
                      },
                      child: Icon(Icons.touch_app_outlined),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
        ),
      ),
    );
  }
}
