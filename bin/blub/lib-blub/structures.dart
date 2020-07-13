import 'lib-blub.dart';
import 's-types.dart';

enum StructuresTypes {
  IF,
  FOR,
  WHILE,
  FUNCTION,
}

class Structures extends ProgramLib {
  Structures(ProgramLibraries ctx) : super(ctx);

  void FUNCTION(VInt condition) {}
}
