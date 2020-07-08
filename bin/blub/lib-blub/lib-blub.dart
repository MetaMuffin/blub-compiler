import '../blub.dart';
import 'globals.dart';
import 'labels.dart';
import 'native-commands.dart';
import 's-values.dart';

void setGC(AssemblerContext c) => gc = c;

void print_static_literal(String text) {
  ASM('; Print with static contents for "${text.replaceAll("\n", "\\n")}"');
  var text_label = static_text_to_labels(text);
  sys_write(SLiteral(1), text_label.toDataLabel(), text_label.toLenLabel());
}

void prep_args_b([S a, S b, S c]) {
  if (a != null) MOV(SRegister(ERegister.ebx), a, 'Prepare arg 1');
  if (b != null) MOV(SRegister(ERegister.ecx), b, 'Prepare arg 2');
  if (c != null) MOV(SRegister(ERegister.edx), c, 'Prepare arg 3');
}

void syscall(S type, [S a, S b, S c]) {
  ASM('mov eax, $type $comment_tabs; Set syscall function index');
  prep_args_b(a, b, c);
  ASM('int 80h $comment_tabs; Trigger syscall interrupt');
}

void sys_exit(S a) => syscall(SLiteral(1), a);
void sys_write(S fd, S inp, S len) => syscall(SLiteral(4), fd, inp, len);
