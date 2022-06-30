import 'package:flutter/material.dart';

void main() {
  // debugPaintSizeEnabled = true;
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Ex07Route extends StatelessWidget {
  const Ex07Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// void main() {
//   // debugPaintSizeEnabled = true;
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Week01',
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           color: Colors.white,
//         ),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// const List<Tab> tabs = <Tab>[
//   Tab(text: 'Zeroth'),
//   Tab(text: 'First'),
//   Tab(text: 'Second'),
// ];

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabs.length,
//       // The Builder widget is used to have a different BuildContext to access
//       // closest DefaultTabController.
//       child: Builder(builder: (BuildContext context) {
//         final TabController tabController = DefaultTabController.of(context)!;
//         tabController.addListener(() {
//           if (!tabController.indexIsChanging) {
//             // Your code goes here.
//             // To get index of current tab use tabController.index
//           }
//         });
//         return Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//                 icon: Image.asset('assets/icons/kodong.png'), onPressed: null),
//             actions: [
//               IconButton(
//                   icon: Image.asset('assets/icons/bangmark.png',
//                       height: 20, width: 20),
//                   onPressed: null),
//             ],
//             bottom: const TabBar(
//               tabs: tabs,
//             ),
//           ),
//           body: TabBarView(
//             children: tabs.map((Tab tab) {
//               return Center(
//                 child: Text(
//                   '${tab.text!} Tab',
//                   style: Theme.of(context).textTheme.headline5,
//                 ),
//               );
//             }).toList(),
//           ),
//         );
//       }),
//     );
//   }
// }

// class FirstRoute extends StatelessWidget {
//   const FirstRoute({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//           },
//           child: const Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   const SecondRoute({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//           },
//           child: const Text('Go to!'),
//         ),
//       ),
//     );
//   }
// }
