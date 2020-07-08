import 'blub/blub.dart';
import 'blub/lib-blub/globals.dart';
import 'blub/lib-blub/lib-blub.dart';
import 'blub/lib-blub/s-values.dart';

void main() {
  var con = AssemblerContext(
    entry: (c) {
      setGC(c);
      COMMENT('Hello World Program');
      print_static_literal('Hello World!');
      sys_exit(SLiteral(0));
    },
  );
  con.save('out.s');
}
