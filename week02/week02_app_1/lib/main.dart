// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week02_app_1/post.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final List<bool> _isSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'week02',
      initialRoute: '/0',
      routes: {
        '/0': (context) => Record(isSelected: _isSelected),
        '/1': (context) => RList(isSelected: _isSelected),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class Record extends StatefulWidget {
  final List<bool> isSelected;
  List posts = [];
  Record({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  late SharedPreferences prefs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void savePost(String title, String content) async {
    prefs = await SharedPreferences.getInstance();
    String? stringList = prefs.getString('postlist');

    List postList = jsonDecode(stringList!);
    for (var post in postList) {
      widget.posts.add(Post().fromJson(post));
    }
    widget.posts.add(Post(title: title, content: content));
    List items = widget.posts.map((e) => e.toJson()).toList();
    print(items);
    prefs.setString('postlist', jsonEncode(items));
  }

  @override
  Widget build(BuildContext context) {
    print("RECORD");
    print(widget.isSelected);
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(''),
        appBar: AppBar(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: TextField(
                      controller: titleController,
                      maxLength: 10,
                      decoration: const InputDecoration(
                        counterText: "",
                        labelText: '제목',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: TextField(
                      controller: contentController,
                      decoration: const InputDecoration(
                        labelText: '내용',
                        labelStyle: TextStyle(color: Colors.grey),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        savePost(titleController.text, contentController.text);
                        titleController.clear();
                        contentController.clear();
                        FocusScope.of(context).unfocus();
                      });
                    },
                    child: const Text('완료'),
                  ),
                ],
              ),
            ),
            BaseNaviBar(isSelected: widget.isSelected),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RList extends StatefulWidget {
  final List<bool> isSelected;
  List posts = [];
  RList({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<RList> createState() => _RListState();
}

class _RListState extends State<RList> {
  late SharedPreferences prefs;

  void setPostList() async {
    prefs = await SharedPreferences.getInstance();
    String? stringList = prefs.getString('postlist');
    List postList = jsonDecode(stringList!);
    for (var post in postList) {
      setState(() {
        widget.posts.add(Post().fromJson(post));
      });
    }
  }

  void removePost(Post post) async {
    prefs = await SharedPreferences.getInstance();
    for (var i in widget.posts) {
      print(i.title);
      print(i.content);
    }
    widget.posts.removeWhere((item) => item == post);

    for (var i in widget.posts) {
      print(i.title);
      print(i.content);
    }
    List items = widget.posts.map((e) => e.toJson()).toList();
    prefs.setString('postlist', jsonEncode(items));
  }

  @override
  void initState() {
    super.initState();
    setPostList();
  }

  @override
  Widget build(BuildContext context) {
    print("RLIST");
    print(widget.isSelected);

    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(''),
        appBar: AppBar(),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: widget.posts.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 8.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(64, 75, 96, .9),
                      ),
                      child: makeListTile(widget.posts[index], index),
                    ));
              }),
          BaseNaviBar(isSelected: widget.isSelected),
        ],
      ),
    );
  }

  makeListTile(Post post, index) {
    return ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: const BoxDecoration(
              border:
                  Border(right: BorderSide(width: 1.0, color: Colors.white24))),
          child: CircleAvatar(
            backgroundColor: Colors.black26,
            child: Text("${index + 1}"),
          ),
        ),
        title: Row(
          children: [
            Text(
              post.title!,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        subtitle: Wrap(
          children: <Widget>[
            Text(post.content!,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(color: Colors.white))
          ],
        ),
        trailing: InkWell(
            onTap: () {
              setState(() {
                removePost(post);
              });
            },
            child: const Icon(Icons.delete, color: Colors.white, size: 30.0)));
  }
}

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = Colors.white;
  final Text title;
  final AppBar appBar;

  const BaseAppBar({
    Key? key,
    required this.title,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          icon: Image.asset('assets/icons/kodong.png'), onPressed: null),
      actions: [
        IconButton(
            icon:
                Image.asset('assets/icons/bangmark.png', height: 20, width: 20),
            onPressed: null),
      ],
      title: title,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

class BaseNaviBar extends StatefulWidget {
  final List<bool> isSelected;

  const BaseNaviBar({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<BaseNaviBar> createState() => _BaseNaviBarState();
}

class _BaseNaviBarState extends State<BaseNaviBar> {
  @override
  Widget build(BuildContext context) {
    print("navibar");
    print(widget.isSelected);
    return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
      child: ToggleButtons(
        disabledColor: Colors.white,
        renderBorder: false,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 0,
        borderColor: Colors.white,
        selectedBorderColor: Colors.white,
        fillColor: Colors.white,
        color: Colors.grey,
        selectedColor: Colors.black,
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
          ToggleButton(name: '기록'),
          ToggleButton(name: '조회'),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String name;
  const ToggleButton({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
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
