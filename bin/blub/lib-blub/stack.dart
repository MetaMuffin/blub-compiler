import 'dart:collection';

import 'lib-blub.dart';
import 's-values.dart';

class StackManager extends ProgramLib {
  StackManager(ProgramLibraries ctx) : super(ctx);

  int local_stack_offset;
  int global_stack_offset;

  LinkedHashMap<String, S> locals;
  Map<String, S> globals;

  void addLocal(String s, S v) {
    local_stack_offset++;
    global_stack_offset++;
    locals.addEntries([MapEntry(s, v)]);
  }

  bool removeLocal(S v) {
    var r = locals.remove(v) != null;
    if (r) local_stack_offset--;
    if (r) global_stack_offset--;
    return r;
  }
}
