import 'lib-blub.dart';
import 's-values.dart';

class IO extends ProgramLib {
  IO(ProgramLibraries lib) : super(lib);

  void print_static_literal(String text) {
    lib.assembler.COMMENT(
        'Print with static contents for "${text.replaceAll("\n", "\\n")}"');
    var text_label = lib.labelManager.static_text_to_labels(text);
    lib.system.write(SLiteral(lib.context, 1), text_label.toDataLabel(),
        text_label.toLenLabel());
  }

  void prep_args_b([S a, S b, S c]) {
    if (a != null) {
      lib.assembler.MOV(SRegister(lib, ERegister.ebx), a, 'Prepare arg 1');
    }
    if (b != null) {
      lib.assembler.MOV(SRegister(lib, ERegister.ecx), b, 'Prepare arg 2');
    }
    if (c != null) {
      lib.assembler.MOV(SRegister(lib, ERegister.edx), c, 'Prepare arg 3');
    }
  }
}
