import 'lib-blub.dart';
import 's-values.dart';

class System extends ProgramLib {
  System(ctx) : super(ctx);

  void syscall(S type, [S a, S b, S c]) {
    lib.assembler.MOV(SRegister(lib.context, ERegister.eax), type,
        'Set syscall function index');
    lib.io.prep_args_b(a, b, c);
    lib.assembler.INT(SLiteral(lib.context, 0x80), 'Trigger syscall interrupt');
  }

  void exit(S a) => syscall(SLiteral(lib.context, 1), a);
  void write(S fd, S inp, S len) =>
      syscall(SLiteral(lib.context, 4), fd, inp, len);
}
