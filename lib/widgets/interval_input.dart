import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class IntervalInput extends StatefulWidget {
  const IntervalInput(
      {required this.intervalSetting, required this.index, super.key});

  final Map<String, int> intervalSetting;
  final int index;

  @override
  State<IntervalInput> createState() => _IntervalInputState();
}

class _IntervalInputState extends State<IntervalInput> {
  late int _currentHours;
  late int _currentMinutes;
  late int _currentSeconds;
  String _currentType = 'active';

  @override
  void initState() {
    _currentHours = widget.intervalSetting['hours']!;
    _currentMinutes = widget.intervalSetting['minutes']!;
    _currentSeconds = widget.intervalSetting['seconds']!;

    super.initState();
  }

  @override
  Widget build(context) {
    var activeColors = const [
      Color.fromRGBO(105, 208, 206, 0.8),
      Color.fromRGBO(25, 210, 28, 0.0)
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: activeColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Text(_currentType),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      NumberPicker(
                        value: _currentHours,
                        minValue: 0,
                        maxValue: 60,
                        onChanged: (value) =>
                            setState(() => _currentHours = value),
                      ),
                      const Text('Hours'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      NumberPicker(
                        value: _currentMinutes,
                        minValue: 0,
                        maxValue: 60,
                        onChanged: (value) =>
                            setState(() => _currentMinutes = value),
                      ),
                      const Text('Minutes'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      NumberPicker(
                        value: _currentSeconds,
                        minValue: 0,
                        maxValue: 60,
                        onChanged: (value) =>
                            setState(() => _currentSeconds = value),
                      ),
                      const Text('Seconds'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
