import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("Reset all data"),
        onPressed: () => globals.reset(),
      ),
    );
  }
}
