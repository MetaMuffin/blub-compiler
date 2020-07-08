import 'globals.dart';
import 's-values.dart';

String comment_tabs = '\t\t';

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

void MOV(S source, S dest, [String comment]) => ASM(
    'mov ${dest.toString()}, ${source.toString()}${optional_comment(comment)}');

void INT(S dnum, [String comment]) =>
    ASM('int ${dnum.toString()}${optional_comment(comment)}');
