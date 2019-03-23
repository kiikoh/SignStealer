import 'package:flutter/material.dart';
import 'PitchSelectionWidget.dart';
import 'SignSelectionWidget.dart';
import 'globals.dart' as globals;

class InputPage extends StatefulWidget {
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      PitchSelectionWidget(refresh),
      SignSelectionWidget(),
    ]);
  }

  refresh() {
    setState(() {});
  }
}
