import 'dart:io';

void saveString(String filename, String s) {
  var f = File(filename);
  f.writeAsStringSync(s);
}
