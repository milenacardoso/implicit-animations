import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:implicit_animations/fade_effect.dart';
import 'package:implicit_animations/moving_items.dart';
import 'package:implicit_animations/relative_space.dart';

import 'color_and_size.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text('IMPLICIT ANIMATIONS:'),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('Animated \nOpacity', FadeEffect()),
                SizedBox(width: 40),
                _buildButton('Animated \nContainer', ColorAndSize()),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton('Animated \nPadding', RelativeSpace()),
                SizedBox(width: 40),
                _buildButton('Animated \nList', MovingItems()),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, Widget className) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => className,
          ),
        );
      },
      child: DottedBorder(
        dashPattern: [6, 3],
        borderType: BorderType.RRect,
        color: Colors.lightBlueAccent,
        radius: Radius.circular(16),
        child: Container(
          padding: EdgeInsets.all(20),
          width: 150,
          height: 150,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(buttonText),
          ),
        ),
      ),
    );
  }
}
