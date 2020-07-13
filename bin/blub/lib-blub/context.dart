import 'lib-blub.dart';

class ProgramContext {
  ProgramLibraries lib;
  ProgramContext(this.lib) {
    lib.context = this;
  }
}
