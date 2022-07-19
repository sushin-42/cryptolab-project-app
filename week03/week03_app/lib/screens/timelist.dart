import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:week03_app/models/periodictime.dart';
import 'package:week03_app/services/timedb.dart';

import 'baseappbar.dart';
import 'basenavibar.dart';

class TimeList extends StatefulWidget {
  final List<bool> isSelected;
  TimeList({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<TimeList> createState() => _TimeListState();
}

class _TimeListState extends State<TimeList> {
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
          timeBuilder(),
          BaseNaviBar(isSelected: widget.isSelected),
        ],
      ),
    );
  }

  Future<List<PeriodicTime>> loadTime() async {
    TimeDBHelper sd = TimeDBHelper();

    var fido = await sd.times();
    return fido;
  }

  Future<void> deleteOneTime(String id) async {
    TimeDBHelper sd = TimeDBHelper();
    sd.deleteTime(id);
  }

  Widget timeBuilder() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<PeriodicTime>> timeSnap) {
        if (timeSnap.data == null) {
          return Container(
            child: GFLoader(type: GFLoaderType.ios),
          );
        } else {
          return ListView.builder(
            itemCount: timeSnap.data?.length,
            itemBuilder: (context, index) {
              PeriodicTime time = timeSnap.data![index];
              return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(64, 75, 96, .9),
                    ),
                    child: makeListTime(time, index),
                  ));
            },
          );
        }
      },
      future: loadTime(),
    );
  }

  makeListTime(PeriodicTime time, index) {
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
              time.time,
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
            Text(time.task,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: const TextStyle(color: Colors.white))
          ],
        ),
        trailing: InkWell(
            onTap: () {
              setState(() {
                deleteOneTime(time.id);
              });
            },
            child: const Icon(Icons.delete, color: Colors.white, size: 30.0)));
  }
}
