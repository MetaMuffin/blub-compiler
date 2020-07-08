import 'blub/blub.dart';
import 'blub/lib-blub/s-values.dart';

void main() {
  var con = Program(
    entry: (c) {
      c.assembler.COMMENT('Hello World Program');
      c.io.print_static_literal('Hello World!');
      c.system.exit(SLiteral(0));
    },
  );
  con.save('out.s');
}
