import 'blub/blub.dart';
import 'blub/lib-blub/s-values.dart';

void main() async {
  var con = Program(
    assemblerFile: 'out.s',
    relocatableFile: 'out.o',
    executableFile: 'out',
    entry: (c) {
      c.assembler.COMMENT('Hello World Program');
      c.io.print_static_literal('Hello World!');
      c.system.exit(SLiteral(0));
    },
  );

  await con.export();
  await con.save();
  await con.compile(format: 'elf64');
  await con.link();
  await con.run();
}
