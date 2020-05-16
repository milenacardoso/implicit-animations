import 'package:flutter/material.dart';

class ColorAndSize extends StatefulWidget {
  @override
  _ColorAndSizeState createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  bool _color = true;
  double _width = 100;
  double _height = 100;
  int _duration = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Change color and resize the yellow box with animated container according to switch',
            ),
            SizedBox(height: 50),
            AnimatedContainer(
              duration: Duration(milliseconds: _duration),
              height: _height,
              width: _width,
              color: _color ? Colors.yellow : Colors.red,
            ),
            SizedBox(height: 16),
            Switch(
              value: _color,
              onChanged: (value) => setState(() => _color = value),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton(
                  Icons.remove,
                  () => _width > 100 ? _width -= 30 : null,
                ),
                Text('Width'),
                _buildButton(
                  Icons.add,
                  () => _width < 270 ? _width += 30 : null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildButton(
                  Icons.remove,
                  () => _height > 100 ? _height -= 30 : null,
                ),
                Text('Height'),
                _buildButton(
                  Icons.add,
                  () => _height < 270 ? _height += 30 : null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData iconData, Function onPressed) {
    return FlatButton(
      shape: CircleBorder(),
      color: Colors.lightBlue,
      child: Icon(iconData),
      textColor: Colors.white,
      onPressed: () => setState(onPressed),
    );
  }
}
