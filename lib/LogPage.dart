import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class LogPage extends StatefulWidget {
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    return _signSuggestions();
  }

  Widget _signSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          if (i ~/ 2 == globals.seqs.length) return null;
          return _buildRow(globals.seqs[i ~/ 2]);
        });
  }

  Widget _buildRow(globals.SignSequence seq) {
    return ListTile(
      title: Text(seq.toString()),
    );
  }
}
