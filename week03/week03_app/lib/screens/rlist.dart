import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:week03_app/models/memo.dart';
import 'package:week03_app/services/db.dart';

import 'baseappbar.dart';
import 'basenavibar.dart';

class RList extends StatefulWidget {
  final List<bool> isSelected;
  RList({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<RList> createState() => _RListState();
}

class _RListState extends State<RList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(''),
        appBar: AppBar(),
      ),
      body: Stack(
        children: [
          memoBuilder(),
          BaseNaviBar(isSelected: widget.isSelected),
        ],
      ),
    );
  }

  Future<List<Memo>> loadMemo() async {
    DBHelper sd = DBHelper();

    var fido = await sd.memos();
    return fido;
  }

  Future<void> deleteOne(String id) async {
    DBHelper sd = DBHelper();
    sd.deleteMemo(id);
  }

  Widget memoBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Memo>> memoSnap) {
        if (memoSnap.data == null) {
          return Container(
            child: GFLoader(type: GFLoaderType.ios),
          );
        } else {
          return ListView.builder(
            itemCount: memoSnap.data?.length,
            itemBuilder: (context, index) {
              Memo memo = memoSnap.data![index];
              return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(64, 75, 96, .9),
                    ),
                    child: makeListTile(memo, index),
                  ));
            },
          );
        }
      },
      future: loadMemo(),
    );
  }

  makeListTile(Memo memo, index) {
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
              memo.title,
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
            Text(memo.text,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(color: Colors.white))
          ],
        ),
        trailing: InkWell(
            onTap: () {
              setState(() {
                deleteOne(memo.id);
              });
            },
            child: const Icon(Icons.delete, color: Colors.white, size: 30.0)));
  }
}
