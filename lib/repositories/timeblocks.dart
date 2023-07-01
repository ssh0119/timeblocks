import 'package:timeblocks/models/timeblock.dart';
import 'package:timeblocks/repositories/persistable.dart';

const String tableName = 'timeblocks';

class TimeblocksRepository with Persistable {
  Timeblock addTimeblock(Timeblock timeblock) {
    insertRecord(tableName, timeblock.toMap());

    return timeblock;
  }

  int removeTimeblock(int id) {
    // ...

    return id;
  }

  Timeblock updateTimeblock(Timeblock timeblock) {
    // ...
    return timeblock;
  }
}
