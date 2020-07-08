import 'dart:io';

import 'lib-blub/lib-blub.dart';

class Program {
  String text = '';
  String data = '';
  ProgramContext pctx;

  Program(
      {void Function(ProgramContext c) entry,
      void Function(ProgramContext c) data_entry}) {
    pctx = ProgramContext(this);
    entry(pctx);
  }

  void save(String filename) {
    var f = File(filename);
    f.writeAsStringSync(
        'section data\n$data\nsection text\nglobal _start\n_start:\n$text');
  }

  void writeCommand(String a) {
    text += '\t$a\n';
  }

  void writeData(String a) {
    data += '\t$a\n';
  }
}
