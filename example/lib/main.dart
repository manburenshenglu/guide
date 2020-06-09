import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guide_widget/guide_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GuideWidget Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GuideWidget Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _imageList = [
    "http://images.china.cn/attachement/jpg/site1000/20120119/0019b91ec8e51081d05a03.jpg",
    "http://images.china.cn/attachement/jpg/site1000/20151229/b8aeed9904ac17ec46225a.jpg",
    "http://d00.paixin.com/thumbs/1033483/23941407/staff_1024.jpg?watermark/1/image/aHR0cDovL2QwMC5wYWl4aW4uY29tL2RwVG8zNjBfd20ucG5n/dissolve/100/gravity/SouthWest/dx/0/dy/0"
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: GuideWidget(
            images: _imageList,
            selectedColor: const Color(0xff1BB754),
            circleRadius: 10.0,
            indicatorPaddingBottom: 10.0,
            indicatorStyle: IndicatorStyle.CIRCLE,
            enter: RaisedButton(
              color: const Color(0xff1BB754),
              onPressed: () {
                // TODO
                Fluttertoast.showToast(msg: 'enter app btn is clicked!');
              },
              textColor: Colors.white,
              child: Text('Enter app'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
            )),
      ),
    );
  }
}
