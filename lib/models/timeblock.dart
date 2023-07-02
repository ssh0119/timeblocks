import 'package:timeblocks/models/interval.dart';

class Timeblock {
  Timeblock({required this.name})
      : intervals = [],
        id = null;

  Timeblock.fromDB({required this.name, required this.id}) : intervals = [];

  final int? id;
  final String name;
  final List<Interval> intervals;

  String get joinedIntervals {
    return intervals.map((interval) => interval.toString()).join();
  }

  Map<String, Object?> toMap() {
    return {'name': name, 'intervals': joinedIntervals};
  }
}
