import 'blub/lib-blub/s-values.dart';
import 'blub/blub.dart';

void main() async {
  var con = Program(
    colorfulOutput: false,
    assemblerFile: 'out.s',
    relocatableFile: 'out.o',
    executableFile: 'out',
    entry: (c) {
      c.lib.assembler.COMMENT('Hello World Program');
      c.lib.io.print_static_literal('Hello World!');
      c.lib.system.exit(SLiteral(c, 0));
    },
  );

  await con.export();
  await con.save();
  //await con.compile(format: 'elf64');
  //await con.link();
  //await con.run();
}
