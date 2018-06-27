import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> _routes = <String, WidgetBuilder>{
    Navigator.defaultRouteName: (context) => new MyHomePage(title: 'Home Page')
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      debugShowMaterialGrid: false,
      routes: _routes,
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        primarySwatch: Colors.cyan,
      ),
      // 使用 _routes 中定义的 默认路由来替代 home
      //home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const String _kAsset0 = 'images/16c477b.jpg';
const String _kAsset1 = 'images/zach.jpg';
const String _kAsset2 = 'images/sandra-adams.jpg';

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  int _currentIndex = 0;

  TabController _controller;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = new Center(
      child: new Padding(
          padding: new EdgeInsets.all(8.0),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                padding: new EdgeInsets.only(bottom: 8.0),
                decoration:
                new BoxDecoration(color: Colors.grey[200]),
                child: new Image.network(
                    'https://flutter.io/images/flutter-mark-square-100.png'),
                margin: new EdgeInsets.only(bottom: 8.0),
                transform: new Matrix4.rotationZ(100.0),
                constraints: new BoxConstraints(minHeight: 150.0),
              ),
              new Text(
                'Flutter is a mobile app SDK for building high-performance, high-fidelity, apps for iOS and Android, from a single codebase.',
                style: new TextStyle(fontSize: 20.0, color: Colors.teal[500]),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                textAlign: TextAlign.left,
              ),
              new RichText(
                text: new TextSpan(
                  text: 'Button tapped ',
                  style: new TextStyle(
                      inherit: true, fontSize: 32.0, color: Colors.black),
                  children: <TextSpan>[
                    new TextSpan(
                        text: '$_counter',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.amber[500])),
                    new TextSpan(text: ' time'),
                    new TextSpan(
                        text: _counter == 1 ? '' : 's',
                        style: new TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Colors.cyan[500])),
                    new TextSpan(text: '.'),
                  ],
                ),
              ),
            ],
          )),
    );

    final List<FlatButton> footerButtons = <FlatButton>[
      new FlatButton(
        child: new Text("OK"),
        onPressed: () => {},
      ),
      new FlatButton(
        child: new Text("CANCEL"),
        onPressed: () => {},
      ),
    ];

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.access_alarm),
          title: new Text('Alarm'),
          backgroundColor: Colors.deepPurple[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.save),
          title: new Text('Save'),
          backgroundColor: Colors.deepOrange[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.cloud),
          title: new Text('Cloud'),
          backgroundColor: Colors.teal[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.favorite),
          title: new Text('Favorites'),
          backgroundColor: Colors.indigo[500],
        )
      ],
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _counter = index;
        });
      },
    );

    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      bottomNavigationBar: botNavBar,
      persistentFooterButtons: footerButtons,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('User Name'),
              accountEmail: new Text('email@example.com'),
              currentAccountPicture:
              new CircleAvatar(backgroundImage: new AssetImage(_kAsset0)),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(backgroundImage: new AssetImage(_kAsset1)),
                new CircleAvatar(backgroundImage: new AssetImage(_kAsset2)),
              ],
              onDetailsPressed: () {},
            ),
            new ClipRect(
              child: new ListTile(
                leading: new CircleAvatar(child: new Text("A")),
                title: new Text('Drawer item A'),
                onTap: _incrementCounter ,
              ),
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text(widget.title),
        //leading: new Icon(Icons.home), 不设置这个属性，则 Drawer 会自动显示一个图标
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {
                // do nothing
              }),
          new PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem<String>(
                    value: "price", child: new Text('Sort by price')),
                new PopupMenuItem<String>(
                    value: "time", child: new Text('Sort by time')),
              ],
              onSelected: (String action) {
                switch (action) {
                  case "price":
                  // do nothing
                    break;
                  case "time":
                  // do nothing
                    break;
                }
              })
        ],
        bottom: new TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: <Widget>[
            new Tab(text: "Tabs 1"),
            new Tab(text: "Tabs 2"),
            new Tab(text: "Tabs 3"),
            new Tab(text: "Tabs 4"),
            new Tab(text: "Tabs 5"),
            new Tab(text: "Tabs 6"),
          ],
        ),
      ),
      body: body,
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}