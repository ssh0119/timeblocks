import 'package:flutter/material.dart';

class TimeblocksListScreen extends StatelessWidget {
  const TimeblocksListScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My timeblocks'),
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
