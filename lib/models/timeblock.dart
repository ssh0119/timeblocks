import 'package:timeblocks/models/interval.dart';

class Timeblock {
  Timeblock({required this.name}) : intervals = [];

  final String name;
  final List<Interval> intervals;
}
