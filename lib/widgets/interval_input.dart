import 'package:flutter/material.dart';

class IntervalInput extends StatelessWidget {
  const IntervalInput({required this.intervalSetting, super.key});

  final Map<String, int> intervalSetting;

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
              Column(
                children: [
                  Text('Input'),
                  Text('Hours'),
                ],
              ),
              Column(
                children: [
                  Text('Input'),
                  Text('Minutes'),
                ],
              ),
              Column(
                children: [
                  Text('Input'),
                  Text('Seconds'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
