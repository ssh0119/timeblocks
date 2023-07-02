import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/repositories/timeblocks.dart';

class TimeblocksNotifier extends StateNotifier<List<Timeblock>> {
  TimeblocksNotifier() : super([]);

  Future<int> insertTimeblock(Timeblock timeblock) async {
    int id = await TimeblocksRepository().addTimeblock(timeblock);
    state = [...state, timeblock];

    return id;
  }

  void fetchPersisted() async {
    List<Map> result = await TimeblocksRepository().fetchAll(tableName);

    state = result.map((result) {
      return Timeblock.fromDB(
        name: result['name'],
        id: result['id'],
      );
    }).toList();
  }
}

final timeblocksProvider =
    StateNotifierProvider<TimeblocksNotifier, List<Timeblock>>(
  (ref) => TimeblocksNotifier(),
);
