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

  void _setIntervalType() {
    setState(() {
      if (_currentType == 'active') {
        _currentType = 'inactive';
      } else {
        _currentType = 'active';
      }
    });
  }

  @override
  Widget build(context) {
    var activeColors = const [
      Color.fromRGBO(105, 208, 206, 0.8),
      Color.fromRGBO(25, 210, 28, 0.0)
    ];

    var inactiveColors = const [
      Color.fromRGBO(241, 163, 162, 0.8),
      Color.fromRGBO(242, 84, 82, 0.8)
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: _currentType == 'active' ? activeColors : inactiveColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: _setIntervalType,
              child: Text(_currentType),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (_currentType == 'active') {
                    return Colors.greenAccent;
                    } else {
                      return Colors.redAccent;
                    }
                  },
                ),
              )),
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
