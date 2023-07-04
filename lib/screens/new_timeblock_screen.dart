import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timeblocks/widgets/timeblock_form.dart';

class NewTimeblockScreen extends ConsumerWidget {
  const NewTimeblockScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New timeblock'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: TimeblockForm(),
      ),
    );
  }
}
