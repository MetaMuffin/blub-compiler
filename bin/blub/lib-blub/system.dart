import 'lib-blub.dart';
import 's-values.dart';

class System extends ProgramLib {
  System(ctx) : super(ctx);

  void syscall(S type, [S a, S b, S c]) {
    ctx.assembler
        .MOV(SRegister(ERegister.eax), type, 'Set syscall function index');
    ctx.io.prep_args_b(a, b, c);
    ctx.assembler.INT(SLiteral(0x80), 'Trigger syscall interrupt');
  }

  void exit(S a) => syscall(SLiteral(1), a);
  void write(S fd, S inp, S len) => syscall(SLiteral(4), fd, inp, len);
}
