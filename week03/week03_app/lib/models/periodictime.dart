class PeriodicTime {
  final String id;
  final String time;
  final String task;

  PeriodicTime({required this.id, required this.time, required this.task});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'time': time,
      'task': task,
    };
  }

  @override
  String toString() {
    return 'PeriodicTime{id: $id, time: $time task: $task}';
  }
}
