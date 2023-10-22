import 'package:flutter/material.dart';
import 'package:midterm/models/mock_data.dart';

import 'screens/list_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MAP Mid Term Test for asiapay',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: ListScreen(noteList),
  ));
}
