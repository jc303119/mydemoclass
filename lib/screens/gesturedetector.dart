import 'package:flutter/material.dart';

class GestureDetector extends StatefulWidget {
  @override
  _GestureDetectorState createState() => _GestureDetectorState();
}

class _GestureDetectorState extends State<GestureDetector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Gesture Demo'),
      ),
      body: Center(
        child: GestureDetector(
          
        )
      ),
    );
  }
}
