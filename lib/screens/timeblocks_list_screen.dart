import 'package:flutter/material.dart';

import 'package:timeblocks/screens/new_timeblock_screen.dart';

class TimeblocksListScreen extends StatelessWidget {
  const TimeblocksListScreen({super.key});

  void _pushNewTimeblockScreen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewTimeblockScreen(),
      ),
    );
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My timeblocks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _pushNewTimeblockScreen(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'No timeblocks added yet...',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
