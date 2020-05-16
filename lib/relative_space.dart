import 'package:flutter/material.dart';

class RelativeSpace extends StatefulWidget {
  @override
  _RelativeSpaceState createState() => _RelativeSpaceState();
}

class _RelativeSpaceState extends State<RelativeSpace> {
  double topValue = 10;
  double bottomValue = 340;
  bool top = true;
  String actionOnTop = 'Fall';
  String actionOnBot = 'Jump';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Padding'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Make the ball jump and fall using animated padding',
            ),
            SizedBox(height: 50),
            Container(
              height: 400,
              child: AnimatedPadding(
                duration: Duration(seconds: 3),
                padding: EdgeInsets.only(top: topValue, bottom: bottomValue),
                curve: top ? Curves.bounceIn : Curves.bounceOut,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
            RaisedButton(
              child: Text(top ? actionOnTop : actionOnBot),
              onPressed: () {
                setState(() {
                  top = !top;
                  topValue = top ? 10 : 340;
                  bottomValue = top ? 340 : 10;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
