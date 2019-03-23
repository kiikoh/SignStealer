import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class PitchSelectionWidget extends StatelessWidget {
  final Function() notifyParent;
  PitchSelectionWidget(this.notifyParent);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      children: <Column>[
        Column(
          children: <RaisedButton>[
            RaisedButton(
              child: Text('Forehead'),
              onPressed: () => _pressed("F"),
            ),
            RaisedButton(
              child: Text('Chin'),
              onPressed: () => _pressed("C"),
            ),
            RaisedButton(
              child: Text('Left Ear'),
              onPressed: () => _pressed("LE"),
            ),
          ],
        ),
        Column(
          children: <RaisedButton>[
            RaisedButton(
              child: Text('Chest'),
              onPressed: () => _pressed("X"),
            ),
            RaisedButton(
              child: Text('Nose'),
              onPressed: () => _pressed("N"),
            ),
            RaisedButton(
              child: Text('Right Ear'),
              onPressed: () => _pressed("RE"),
            ),
          ],
        ),
      ],
    ));
  }

  void _pressed(String s) {
    globals.touches += s + " ";
    notifyParent();
  }
}
