import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class SignSelectionWidget extends StatefulWidget {
  _SignSelectionWidgetState createState() => _SignSelectionWidgetState();
}

class _SignSelectionWidgetState extends State<SignSelectionWidget> {
  final pitchList = ['Fastball', 'Curveball', 'Changeup'];
  int _selected = -1;
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Divider(),
      Row(
        children: <Widget>[
          Radio(
            value: 0,
            groupValue: _selected,
            onChanged: _selectionChanged,
          ),
          Text('${pitchList[0]} - ${globals.results[0]}'),
        ],
      ),
      Row(
        children: <Widget>[
          Radio(
            value: 1,
            groupValue: _selected,
            onChanged: _selectionChanged,
          ),
          Text('${pitchList[1]} - ${globals.results[1]}'),
        ],
      ),
      Row(
        children: <Widget>[
          Radio(
            value: 2,
            groupValue: _selected,
            onChanged: _selectionChanged,
          ),
          Text('${pitchList[2]} - ${globals.results[2]}'),
        ],
      ),
      RaisedButton(
        child: Text('Submit'),
        onPressed: _submitLog,
      ),
      Divider(),
      Center(
        child: Text("${globals.touches}"),
      ),
    ]);
  }

  void _selectionChanged(int value) {
    setState(() {
      _selected = value;
    });
  }

  void _submitLog() {
    if (_selected != -1 && ' '.allMatches(globals.touches).length > 1) {
      setState(() {
        globals.seqs.add(
            new globals.SignSequence(pitchList[_selected], globals.touches));
        globals.touches = '';
        globals.results = globals.getPredictions();
      });
    }
  }
}
