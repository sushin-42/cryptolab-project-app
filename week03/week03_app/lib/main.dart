import 'package:flutter/material.dart';
import 'package:week03_app/screens/background.dart';
import 'package:week03_app/screens/record.dart';
import 'package:week03_app/screens/rlist.dart';
import 'package:week03_app/screens/timelist.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    false,
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
        '/1': (context) => RList(
              isSelected: _isSelected,
            ),
        '/2': (context) => Background(
              isSelected: _isSelected,
            ),
        '/3': (context) => TimeList(
              isSelected: _isSelected,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
