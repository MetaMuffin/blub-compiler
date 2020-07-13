import '../blub.dart';

import 'context.dart';
import 'io.dart';
import 'assembler.dart';
import 'labels.dart';
import 'structures.dart';
import 'system.dart';

class ProgramLibraries {
  Program program;

  System system;
  IO io;
  Assembler assembler;
  LabelManager labelManager;
  Structures structures;

  ProgramContext context;

  ProgramLibraries(this.program) {
    system = System(this);
    io = IO(this);
    assembler = Assembler(this);
    labelManager = LabelManager(this);
    structures = Structures(this);
  }
}

abstract class ProgramLib {
  ProgramLibraries lib;
  ProgramLib(this.lib);
}

typedef ProgramBuilder = void Function(ProgramContext c);
