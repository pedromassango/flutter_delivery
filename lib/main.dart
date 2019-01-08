import 'package:delivery/circular_image.dart';
import 'package:delivery/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:delivery/zoom_scaffold.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Zoom Menu',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new ZoomScaffold(
      menuScreen: MenuScreen(),
      contentScreen: Layout(
          contentBuilder: (cc)=> Container(
            color: Colors.grey[200],
            child: Container(
              color: Colors.grey[200],
            ),
          )
      ),
    );
  }
}