import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 900),
          margin: EdgeInsets.all(_margin),
          color: _color,
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() => _margin = _margin == 0 ? 50 : 0);
                },
                child: Text('Animate Margin'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() => _color = Colors.deepPurple);
                },
                child: Text('Animate Color'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() => _width = _width == 200 ? 400 : 200);
                },
                child: Text('Animate Width'),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() => _opacity = _opacity == 1 ? 0 : 1);
                },
                child: Text('Animate Opacity'),
              ),
              AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _opacity,
                child: Text(
                  'Hide Me',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
