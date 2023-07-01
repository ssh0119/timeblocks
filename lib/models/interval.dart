enum TimeType { active, inactive }

class Interval {
  Interval({required this.timeType, required this.lengthInSeconds});

  Interval.active({required this.lengthInSeconds}) : timeType = TimeType.active;
  Interval.inactive({required this.lengthInSeconds})
      : timeType = TimeType.inactive;

  final TimeType timeType;
  final int lengthInSeconds;

  @override
  String toString() {
    return '${timeType.name};$lengthInSeconds;';
  }
}
