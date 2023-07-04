import 'package:timeblocks/models/interval.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Timeblock {
  Timeblock({required this.name}) : intervals = [], id = uuid.v4();

  Timeblock.fromDB({required this.name, required this.id}) : intervals = [];

  final String id;
  final String name;
  final List<Interval> intervals;

  String get joinedIntervals {
    return intervals.map((interval) => interval.toString()).join();
  }

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'intervals': joinedIntervals};
  }
}
