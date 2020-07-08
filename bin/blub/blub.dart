import 'io.dart';

void writeCommand(AssemblerContext c, String a) {
  c.text += '\t$a\n';
}

void writeData(AssemblerContext c, String a) {
  c.data += '\t$a\n';
}

class AssemblerContext {
  String text = '';
  String data = '';

  AssemblerContext(
      {void Function(AssemblerContext c) entry,
      void Function(AssemblerContext c) data_entry}) {
    entry(this);
    if (data_entry != null) data_entry(this);
  }

  void save(String filename) {
    saveString(filename,
        'section data\n$data\nsection text\nglobal _start\n_start:\n$text');
  }
}
