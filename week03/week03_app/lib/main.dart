import 'package:flutter/material.dart';
import 'package:week03_app/screens/record.dart';
import 'package:week03_app/screens/rlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<bool> _isSelected = [
    true,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'week03',
      initialRoute: '/0',
      routes: {
        '/0': (context) => Record(
              isSelected: _isSelected,
            ),
        '/1': (context) => RList(isSelected: _isSelected),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
