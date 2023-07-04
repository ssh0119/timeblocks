import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class IntervalInput extends StatefulWidget {
  const IntervalInput({required this.intervalSetting, super.key});

  final Map<String, int> intervalSetting;

  @override
  State<IntervalInput> createState() => _IntervalInputState();
}

class _IntervalInputState extends State<IntervalInput> {
  late int _currentHours;
  late int _currentMinutes;
  late int _currentSeconds;

  @override
  void initState() {
    _currentHours = widget.intervalSetting['hours']!;
    _currentMinutes = widget.intervalSetting['minutes']!;
    _currentSeconds = widget.intervalSetting['seconds']!;

    super.initState();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Text('Active'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Column(
                children: [
                  NumberPicker(
                    value: _currentHours,
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (value) => setState(() => _currentHours = value),
                  ),
                  const Text('Hours'),
                ],
              ),),
              Expanded(child: Column(
                children: [
                  NumberPicker(
                    value: _currentMinutes,
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (value) => setState(() => _currentMinutes = value),
                  ),
                  const Text('Minutes'),
                ],
              ),),
              Expanded(child: Column(
                children: [
                  NumberPicker(
                    value: _currentSeconds,
                    minValue: 0,
                    maxValue: 60,
                    onChanged: (value) => setState(() => _currentSeconds = value),
                  ),
                  const Text('Seconds'),
                ],
              ),),
            ],
          ),
        ),
      ],
    );
  }
}
