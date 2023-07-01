import 'package:timeblocks/models/interval.dart';

class Timeblock {
  Timeblock({required this.name}) : intervals = [];

  final String name;
  final List<Interval> intervals;

  String get joinedIntervals {
    return intervals.map((interval) => interval.toString()).join();
  }

  Map toMap() {
    return {'name': name, 'intervals': joinedIntervals};
  }
}
