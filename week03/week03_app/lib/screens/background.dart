import 'package:flutter/material.dart';
import 'package:week03_app/screens/baseappbar.dart';
import 'package:week03_app/screens/basenavibar.dart';
import 'package:week03_app/services/timedb.dart';
import 'package:workmanager/workmanager.dart';

const taskonetime = "taskOneTime";
const taskdelayedtime = "taskDelayedTime";
const taskmperiodictime = "taskMPeriodicTime";
const taskhperiodictime = "taskHPeriodicTime";

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case taskonetime:
        print("$taskName was executed");
        await saveTimeDB(taskName);

        break;
      case taskdelayedtime:
        print("$taskName was executed");
        await saveTimeDB(taskName);

        break;
      case taskmperiodictime:
        print("$taskName was executed");
        await saveTimeDB(taskName);

        break;
      case taskhperiodictime:
        print("$taskName was executed");
        await saveTimeDB(taskName);

        break;
      default:
    }
    return Future.value(true);
  });
}

class Background extends StatefulWidget {
  final List<bool> isSelected;

  const Background({Key? key, required this.isSelected}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: const Text(''),
        appBar: AppBar(),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Start the Flutter background service"),
                  onPressed: () {
                    Workmanager().initialize(
                      callbackDispatcher,
                      isInDebugMode: true,
                    );
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      Workmanager().registerOneOffTask(
                        taskonetime,
                        taskonetime,
                      );
                    },
                    child: Text('$taskonetime')),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Workmanager().registerOneOffTask(
                        taskdelayedtime,
                        taskdelayedtime,
                        initialDelay: Duration(seconds: 5),
                      );
                    },
                    child: Text('$taskdelayedtime')),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Workmanager().registerPeriodicTask(
                        taskmperiodictime,
                        taskmperiodictime,
                        frequency: Duration(minutes: 1),
                        constraints: Constraints(
                          networkType: NetworkType.not_required,
                          requiresBatteryNotLow: false,
                          requiresCharging: false,
                          requiresDeviceIdle: false,
                          requiresStorageNotLow: false,
                        ),
                      );
                    },
                    child: Text('$taskmperiodictime')),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Workmanager().registerPeriodicTask(
                        taskhperiodictime,
                        taskhperiodictime,
                        frequency: Duration(hours: 1),
                        constraints: Constraints(
                          networkType: NetworkType.not_required,
                          requiresBatteryNotLow: false,
                          requiresCharging: false,
                          requiresDeviceIdle: false,
                          requiresStorageNotLow: false,
                        ),
                      );
                    },
                    child: Text('$taskhperiodictime')),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text("Cancel All"),
                  onPressed: () async {
                    await Workmanager().cancelAll();
                    print('Cancel all tasks completed');
                  },
                ),
              ],
            ),
          ),
          BaseNaviBar(isSelected: widget.isSelected)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

/*
registerOneOffTask




*/