import 'lib-blub.dart';
import 's-values.dart';

class IO extends ProgramLib {
  IO(ctx) : super(ctx);

  void print_static_literal(String text) {
    ctx.assembler.COMMENT(
        'Print with static contents for "${text.replaceAll("\n", "\\n")}"');
    var text_label = ctx.labelManager.static_text_to_labels(text);
    ctx.system.sys_write(
        SLiteral(1), text_label.toDataLabel(), text_label.toLenLabel());
  }

  void prep_args_b([S a, S b, S c]) {
    if (a != null) {
      ctx.assembler.MOV(SRegister(ERegister.ebx), a, 'Prepare arg 1');
    }
    if (b != null) {
      ctx.assembler.MOV(SRegister(ERegister.ecx), b, 'Prepare arg 2');
    }
    if (c != null) {
      ctx.assembler.MOV(SRegister(ERegister.edx), c, 'Prepare arg 3');
    }
  }
}
