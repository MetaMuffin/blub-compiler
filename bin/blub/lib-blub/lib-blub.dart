import '../blub.dart';
import 's-values.dart';

AssemblerContext gc;
int globalLabelCounter = 0;
int globalDataLabelCounter = 0;

void setGC(AssemblerContext c) => gc = c;

void DATA(String s) => writeData(gc, s);
void ASM(String s) => writeCommand(gc, s);
void COMMENT(String c) => writeCommand(gc, '; $c');

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

SDataLabel unique_label([String s]) => SDataLabel(
      ((s == null) ? '' : '${s}_') + '${globalLabelCounter++}',
    );

SDataLabel unique_data_label([String s]) => SDataLabel(
      ((s == null) ? '' : '${s}_') + '${globalDataLabelCounter++}',
    );

SDataLabelWithLen static_text_to_labels(String text) {
  var label = unique_data_label('print_static');
  var label_len = SDataLabel(label.name + '_len');
  DATA('$label db \"$text\"');
  DATA('$label_len equ \$-$label');
  return SDataLabelWithLen(
    name: label.toString(),
    len_name: label_len.toString(),
  );
}

void print_static_literal(String text) {
  ASM('; Print with static contents for "${text.replaceAll("\n", "\\n")}"');
  var text_label = static_text_to_labels(text);
  sys_write(SLiteral(1), text_label.toDataLabel(), text_label.toLenLabel());
}

void prep_args_b([S a, S b, S c]) {
  if (a != null) ASM('mov ebx, ${a.toString()} ; Prepare arg 1');
  if (b != null) ASM('mov ecx, ${b.toString()} ; Prepare arg 2');
  if (c != null) ASM('mov edc, ${c.toString()} ; Prepare arg 3');
}

void syscall(S type, [S a, S b, S c]) {
  ASM('mov eax, $type ; Set syscall function index');
  prep_args_b(a, b, c);
  ASM('int 80h ; Trigger syscall interrupt');
}

void sys_exit(S a) => syscall(SLiteral(1), a);
void sys_write(S fd, S inp, S len) => syscall(SLiteral(4), fd, inp, len);
