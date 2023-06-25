import 'package:timeblocks/models/interval.dart';

class Timeblock {
  Timeblock({required this.title}) : intervals = [];

  final String title;
  final List<Interval> intervals;
}
