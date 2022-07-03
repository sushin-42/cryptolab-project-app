import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week01',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List _tabPages = [
    Ex01Route(),
    Ex02Route(),
    Ex03Route(),
    Ex04Route(),
    Ex05Route(),
    Ex06Route(),
    Ex07Route(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      body: Center(
        child: _tabPages[_selectedIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.exposure_zero_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_4), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_5), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.looks_6), label: ''),
          ],
        ),
      ),
    );
  }
}

class Ex01Route extends StatelessWidget {
  const Ex01Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 주 축 기준 중앙
          children: const <Widget>[
            Icon(
              Icons.arrow_circle_up,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'That\'s the appbar',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class Ex02Route extends StatelessWidget {
  const Ex02Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 70,
            color: const Color(0xffff0000),
          ),
          Container(
            height: 70,
            color: const Color(0xff00ff00),
          ),
          Container(
            height: 70,
            color: const Color(0xff0000ff),
          ),
        ],
      ),
    );
  }
}

class Ex03Route extends StatelessWidget {
  const Ex03Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            color: const Color(0xffff0000),
          ),
          Container(
            height: 70,
            width: 70,
            color: const Color(0xff00ff00),
          ),
          Container(
            height: 70,
            width: 70,
            color: const Color(0xff0000ff),
          ),
        ],
      ),
    );
  }
}

class Ex04Route extends StatelessWidget {
  const Ex04Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            color: const Color(0xffff0000),
          ),
          Expanded(
            child: Container(
              height: 70,
              color: const Color(0xff00ff00),
            ),
          ),
          Container(
            height: 70,
            color: const Color(0xff0000ff),
          ),
        ],
      ),
    );
  }
}

class Ex05Route extends StatelessWidget {
  const Ex05Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: 70,
              color: const Color(0xffff0000),
            ),
          ),
          Container(
            width: 70,
            color: const Color(0xff00ff00),
          ),
          Container(
            width: 70,
            color: const Color(0xff0000ff),
          ),
        ],
      ),
    );
  }
}

class Ex06Route extends StatelessWidget {
  const Ex06Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                height: 70,
                color: const Color(0xffff0000),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70,
                height: 70,
                color: const Color(0xff00ff00),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 70,
                height: 70,
                color: const Color(0xff0000ff),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Ex07Route extends StatefulWidget {
  const Ex07Route({Key? key}) : super(key: key);
  @override
  State<Ex07Route> createState() => _Ex07Route();
}

class _Ex07Route extends State<Ex07Route> {
  bool isChecked = true;
  final List<Container> _containerList = [];
  void _addContainer() {
    setState(() {
      _containerList.add(_cntr());
    });
  }

  Container _cntr() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Checkbox(
                activeColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(
                    () {
                      isChecked = value!;
                    },
                  );
                },
              ),
              Text(
                '제목${_containerList.length + 1}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
            child: Text(
              '내용',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _addContainer,
        tooltip: 'Add',
        backgroundColor: Colors.grey,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: _containerList.length,
          itemBuilder: (context, index) {
            return _containerList[index];
          }),
    );
  }
}
