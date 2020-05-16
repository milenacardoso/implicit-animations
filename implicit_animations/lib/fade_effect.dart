import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeEffect extends StatefulWidget {
  @override
  _FadeEffectState createState() => _FadeEffectState();
}

class _FadeEffectState extends State<FadeEffect> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hide and show the green box with animated opacity according to switch',
            ),
            SizedBox(height: 50),
            AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: Duration(milliseconds: 1500),
              curve: Curves.linear,
              child: Container(
                color: Colors.lightGreen,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 16),
            Switch(
              value: _visible,
              onChanged: (value) => setState(() => _visible = value),
            ),
          ],
        ),
      ),
    );
  }
}
