import 'lib-blub.dart';
import 's-values.dart';

class Assembler extends ProgramLib {
  Assembler(ctx) : super(ctx);

  void MOV(S dest, S source, [String comment]) => ASM(
      'mov ${dest.toString()}, ${source.toString()}${optional_comment(comment)}');

  void INT(S dnum, [String comment]) =>
      ASM('int ${dnum.toString()}${optional_comment(comment)}');

  void ADD(S target, S b, [String comment]) => ASM(
      'add ${target.toString()}, ${b.toString()}${optional_comment(comment)}');

  String comment_tabs = '\t\t';

  void DATA(String s) => lib.program.writeData(s);
  void ASM(String s) => lib.program.writeCommand(s);
  void COMMENT(String c) => lib.program.writeCommand('; $c');

  void ASM_l(List<String> sl) {
    for (var s in sl) {
      ASM(s);
    }
  }

  void DATA_l(List<String> sl) {
    for (var s in sl) {
      DATA(s);
    }
  }

  String optional_comment(String comment) {
    return (comment == null) ? '' : (' ;${comment_tabs} ' + comment);
  }
}
