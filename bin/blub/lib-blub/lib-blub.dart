import '../blub.dart';
import 'io.dart';
import 'assembler.dart';
import 'labels.dart';
import 'structures.dart';
import 'system.dart';

class ProgramContext {
  Program program;

  System system;
  IO io;
  Assembler assembler;
  LabelManager labelManager;
  Structures structures;

  ProgramContext(this.program) {
    system = System(this);
    io = IO(this);
    assembler = Assembler(this);
    labelManager = LabelManager(this);
    structures = Structures(this);
  }
}

abstract class ProgramLib {
  ProgramContext ctx;
  ProgramLib(this.ctx);
}
