import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'SettingsPage.dart';
import 'LogPage.dart';
import 'globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Stealer',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
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
  int _selectedIndex = 0;
  final _widgetOptions = [
    InputPage(),
    LogPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Stealer'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.edit), title: Text('Input')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Log')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
