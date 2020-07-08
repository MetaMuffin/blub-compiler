import '../blub.dart';
import 'io.dart';
import 'assembler.dart';
import 'labels.dart';
import 'system.dart';

class ProgramContext {
  int local_stack_offset;
  int global_stack_offset;

  Program program;

  System system;
  IO io;
  Assembler assembler;
  LabelManager labelManager;

  ProgramContext(this.program) {
    system = System(this);
    io = IO(this);
    assembler = Assembler(this);
    labelManager = LabelManager(this);
  }
}

abstract class ProgramLib {
  ProgramContext ctx;
  ProgramLib(this.ctx);
}
