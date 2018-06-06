import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');
  final Key keyThree = PageStorageKey('pageThree');
  

  int currentTab = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    dataList = [
      Data(1, false, "Example-1"),
      Data(2, false, "Example-2"),
      Data(3, false, "Example-3"),
      Data(4, false, "Example-4"),
      Data(5, false, "Example-5"),
      Data(6, false, "Example-6"),
      Data(7, false, "Example-7"),
      Data(8, false, "Example-8"),
      Data(9, false, "Example-9"),
      Data(10, false, "Example-10"),
    ];
    one = PageOne(
      key: keyOne,
      //dataList: dataList,
    );
    two = PageTwo(
      key: keyTwo,
    );

    three = PageThree(key: keyThree,);
    pages = [one, two, three];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Market"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            title: Text("Support"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text("Profile"),
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  
  PageOne({
    Key key,
    
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Card(
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(top: 16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              new Text(
                'Home ',
                style: new TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF26C6DA)
                ),
              )
            ],
          ),
        ),
        
      ],
    ),
    );
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({Key key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Card(
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(top: 16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              new Text(
                'Support ',
                style: new TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF26C6DA)
                ),
              )
            ],
          ),
        ),
        
      ],
    ),
    );
  }
}

class PageThree extends StatefulWidget {
  PageThree({Key key}) : super(key: key);

  @override
  PageThreeState createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Card(
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.only(top: 16.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              new Text(
                'Profile ',
                style: new TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFF26C6DA)
                ),
              )
            ],
          ),
        ),
        
      ],
    ),
    );
  }
}

class Data {
  final int id;
  bool expanded;
  final String title;
  Data(this.id, this.expanded, this.title);
}