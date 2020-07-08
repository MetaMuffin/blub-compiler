import '../blub.dart';

AssemblerContext gc;
void DATA(String s) => writeData(gc, s);
void ASM(String s) => writeCommand(gc, s);
void COMMENT(String c) => writeCommand(gc, '; $c');
