import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<bool> _isSelected = [
    true,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week01',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      initialRoute: '/0',
      routes: {
        '/0': (context) => Ex01Route(isSelected: _isSelected),
        '/1': (context) => Ex02Route(isSelected: _isSelected),
        '/2': (context) => Ex03Route(isSelected: _isSelected),
      },
    );
  }
}

class Ex01Route extends StatefulWidget {
  final List<bool> isSelected;
  const Ex01Route({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Ex01Route> createState() => _Ex01Route();
}

class _Ex01Route extends State<Ex01Route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset('assets/icons/kodong.png'), onPressed: null),
          actions: [
            IconButton(
                icon: Image.asset('assets/icons/bangmark.png',
                    height: 20, width: 20),
                onPressed: null),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      '1',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: const Text(
                      '하아아나',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: ToggleButtons(
                renderBorder: false,
                color: Colors.white,
                constraints: const BoxConstraints(minHeight: 36.0),
                isSelected: widget.isSelected,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int i = 0; i < widget.isSelected.length; i++) {
                      if (i == newIndex) {
                        widget.isSelected[i] = true;
                        Navigator.popAndPushNamed(context, '/$newIndex');
                      } else {
                        widget.isSelected[i] = false;
                      }
                    }
                  });
                },
                children: const [
                  ToggleButton(name: '1'),
                  ToggleButton(name: '2'),
                  ToggleButton(name: '3'),
                ],
              ),
            ),
          ],
        ));
  }
}

class Ex02Route extends StatefulWidget {
  final List<bool> isSelected;
  const Ex02Route({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Ex02Route> createState() => _Ex02Route();
}

class _Ex02Route extends State<Ex02Route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset('assets/icons/kodong.png'), onPressed: null),
          actions: [
            IconButton(
                icon: Image.asset('assets/icons/bangmark.png',
                    height: 20, width: 20),
                onPressed: null),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      '2',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      '두우우울',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: ToggleButtons(
                renderBorder: false,
                color: Colors.white,
                constraints: const BoxConstraints(minHeight: 36.0),
                isSelected: widget.isSelected,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int i = 0; i < widget.isSelected.length; i++) {
                      if (i == newIndex) {
                        widget.isSelected[i] = true;
                        Navigator.popAndPushNamed(context, '/$newIndex');
                      } else {
                        widget.isSelected[i] = false;
                      }
                    }
                  });
                },
                children: const [
                  ToggleButton(name: '1'),
                  ToggleButton(name: '2'),
                  ToggleButton(name: '3'),
                ],
              ),
            ),
          ],
        ));
  }
}

class Ex03Route extends StatefulWidget {
  final List<bool> isSelected;
  const Ex03Route({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Ex03Route> createState() => _Ex03Route();
}

class _Ex03Route extends State<Ex03Route> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset('assets/icons/kodong.png'), onPressed: null),
          actions: [
            IconButton(
                icon: Image.asset('assets/icons/bangmark.png',
                    height: 20, width: 20),
                onPressed: null),
          ],
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      '3',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    child: const Text(
                      '세에에엣',
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              child: ToggleButtons(
                renderBorder: false,
                color: Colors.white,
                constraints: const BoxConstraints(minHeight: 36.0),
                isSelected: widget.isSelected,
                onPressed: (int newIndex) {
                  setState(() {
                    for (int i = 0; i < widget.isSelected.length; i++) {
                      if (i == newIndex) {
                        widget.isSelected[i] = true;
                        Navigator.popAndPushNamed(context, '/$newIndex');
                      } else {
                        widget.isSelected[i] = false;
                      }
                    }
                  });
                },
                children: const [
                  ToggleButton(name: '1'),
                  ToggleButton(name: '2'),
                  ToggleButton(name: '3'),
                ],
              ),
            ),
          ],
        ));
  }
}

class ToggleButton extends StatelessWidget {
  final String name;
  const ToggleButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
          color: Colors.lightBlue.shade200,
          borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.symmetric(vertical: 4),
      alignment: Alignment.center,
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
