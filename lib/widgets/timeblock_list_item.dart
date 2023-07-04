import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/providers/timeblocks_provider.dart';

class TimeblockListItem extends ConsumerWidget {
  const TimeblockListItem({required this.timeblock, super.key});

  final Timeblock timeblock;

  void _onDismissed(WidgetRef ref) {
    ref.read(timeblocksProvider.notifier).deleteTimeblock(timeblock);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      onDismissed: (direction) {
        _onDismissed(ref);
      },
      key: ValueKey(timeblock.id),
      child: ListTile(
        title: Text(timeblock.name),
      ),
    );
  }
}
