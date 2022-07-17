// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week02_app_3/post.dart';
import 'package:workmanager/workmanager.dart';

void main() => runApp(MyApp());

const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
const rescheduledTaskKey = "be.tramckrijte.workmanagerExample.rescheduledTask";
const failedTaskKey = "be.tramckrijte.workmanagerExample.failedTask";
const simpleDelayedTask = "be.tramckrijte.workmanagerExample.simpleDelayedTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";
const simplePeriodic1HourTask =
    "be.tramckrijte.workmanagerExample.simplePeriodic1HourTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case simpleTaskKey:
        print("$simpleTaskKey was executed. inputData = $inputData");
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool("test", true);
        print("Bool from prefs: ${prefs.getBool("test")}");
        break;
      case rescheduledTaskKey:
        final key = inputData!['key']!;
        final prefs = await SharedPreferences.getInstance();
        if (prefs.containsKey('unique-$key')) {
          print('has been running before, task is successful');
          return true;
        } else {
          await prefs.setBool('unique-$key', true);
          print('reschedule task');
          return false;
        }
      case failedTaskKey:
        print('failed task');
        return Future.error('failed');
      case simpleDelayedTask:
        print("$simpleDelayedTask was executed");
        break;
      case simplePeriodicTask:
        print("$simplePeriodicTask was executed");
        break;
      case simplePeriodic1HourTask:
        print("$simplePeriodic1HourTask was executed");
        break;
      case Workmanager.iOSBackgroundTask:
        print("The iOS background fetch was triggered");
        Directory? tempDir = await getTemporaryDirectory();
        String? tempPath = tempDir.path;
        print(
            "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): $tempPath");
        break;
    }

    return Future.value(true);
  });
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  late List<Post> times;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    setPostList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WorkManager Example"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Plugin initialization",
                  style: Theme.of(context).textTheme.headline5,
                ),
                ElevatedButton(
                  child: const Text("Start the Flutter background service"),
                  onPressed: () {
                    Workmanager().initialize(
                      callbackDispatcher,
                      isInDebugMode: true,
                    );
                  },
                ),
                const SizedBox(height: 16),

                //This task runs once.
                //Most likely this will trigger immediately
                // ElevatedButton(
                //   child: const Text("Register OneOff Task"),
                //   onPressed: () {
                //     Workmanager().registerOneOffTask(
                //       simpleTaskKey,
                //       simpleTaskKey,
                //       inputData: <String, dynamic>{
                //         'int': 1,
                //         'bool': true,
                //         'double': 1.0,
                //         'string': 'string',
                //         'array': [1, 2, 3],
                //       },
                //     );
                //   },
                // ),
                // ElevatedButton(
                //   child: const Text("Register rescheduled Task"),
                //   onPressed: () {
                //     Workmanager().registerOneOffTask(
                //       rescheduledTaskKey,
                //       rescheduledTaskKey,
                //       inputData: <String, dynamic>{
                //         'key': Random().nextInt(64000),
                //       },
                //     );
                //   },
                // ),
                // ElevatedButton(
                //   child: const Text("Register failed Task"),
                //   onPressed: () {
                //     Workmanager().registerOneOffTask(
                //       failedTaskKey,
                //       failedTaskKey,
                //     );
                //   },
                // ),
                //This task runs once
                //This wait at least 10 seconds before running
                // ElevatedButton(
                //     child: const Text("Register Delayed OneOff Task"),
                //     onPressed: () {
                //       Workmanager().registerOneOffTask(
                //         simpleDelayedTask,
                //         simpleDelayedTask,
                //         initialDelay: const Duration(seconds: 10),
                //       );
                //     }),
                const SizedBox(height: 8),
                //This task runs periodically
                //It will wait at least 10 seconds before its first launch
                //Since we have not provided a frequency it will be the default 15 minutes
                ElevatedButton(
                    onPressed: Platform.isAndroid
                        ? () {
                            Workmanager().registerPeriodicTask(
                              simplePeriodicTask,
                              simplePeriodicTask,
                              initialDelay: const Duration(seconds: 10),
                            );
                          }
                        : null,
                    child: const Text("Register Periodic Task (Android)")),
                //This task runs periodically
                //It will run about every hour
                ElevatedButton(
                    onPressed: Platform.isAndroid
                        ? () {
                            Workmanager().registerPeriodicTask(
                              simplePeriodicTask,
                              simplePeriodic1HourTask,
                              frequency: const Duration(minutes: 15),
                            );
                          }
                        : null,
                    child: const Text(
                        "Register 15 minutes Periodic Task (Android)")),
                const SizedBox(height: 16),
                Text(
                  "Task cancellation",
                  style: Theme.of(context).textTheme.headline5,
                ),
                ElevatedButton(
                  child: const Text("Cancel All"),
                  onPressed: () async {
                    await Workmanager().cancelAll();
                    print('Cancel all tasks completed');
                  },
                ),
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: widget.times.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text('${widget.times[index].time}');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void control() async {
    DateTime now = DateTime.now();

    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString()}-${now.minute.toString()}";
    late SharedPreferences prefs;

    prefs = await SharedPreferences.getInstance();
    String? timeList = prefs.getString('times');
    List spostList = jsonDecode(timeList!);

    for (var post in spostList) {
      widget.times.add(Post().fromJson(post));
    }

    widget.times.add(Post(time: convertedDateTime));
    List items = widget.times.map((e) => e.toJson()).toList();
    prefs.setString('times', jsonEncode(items));
  }

  void setPostList() async {
    late SharedPreferences prefs;

    prefs = await SharedPreferences.getInstance();
    String? stringList = prefs.getString('postlist');
    List postList = jsonDecode(stringList!);

    for (var post in postList) {
      setState(() {
        widget.times.add(Post().fromJson(post));
      });
    }
  }
}
