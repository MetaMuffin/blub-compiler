import 'dart:io';
import 'lib-blub/lib-blub.dart';
import 'lib-blub/context.dart';

class Program {
  String text = '';
  String data = '';
  ProgramLibraries pctx;

  String assemblerFile;
  String relocatableFile;
  String executableFile;
  bool colorfulOutput = false;

  void Function(ProgramContext c) entry;

  Program({
    this.colorfulOutput,
    this.entry,
    this.assemblerFile,
    this.executableFile,
    this.relocatableFile,
  }) {
    pctx = ProgramLibraries(this);
    if (!stdout.supportsAnsiEscapes) print('No ansi escape support. :(');
  }

  String _success(String s) {
    return (colorfulOutput) ? '\033[32;1m${s}\033[0m' : s;
  }

  String _info(String s) {
    return (colorfulOutput) ? '\033[32;1m${s}\033[0m' : s;
  }

  void _print(String s) {
    stdout.write(s);
  }

  void export() {
    _print('Exporting...');
    entry(ProgramContext(pctx));
    _print(' done\n');
  }

  void save() {
    _print(_info('Saving assembler code to "$assemblerFile"'));
    var f = File(assemblerFile);
    f.writeAsStringSync(
        'section data\n$data\nsection text\nglobal _start\n_start:\n$text');
    _print('\n ${_success("done")}\n');
  }

  void compile({String format, List<String> args, String compiler}) async {
    _print(_info('Compiling...'));

    args ??= [];
    compiler ??= 'nasm';
    format ??= 'elf32';
    var cargs = ['-f $format', '-o $relocatableFile'];
    cargs.addAll(args);
    cargs.add(assemblerFile);

    _print('\t\t\$ $compiler ${cargs.join(" ")}');
    var results = await Process.run(compiler, cargs);
    print(results.stderr);
    _print(' ${_success("done")}\n');
  }

  void link(
      {String linker,
      List<String> args,
      bool setExecutableAttrib = true}) async {
    _print(_info('Linking...'));

    args ??= [];
    linker ??= 'ld';
    var largs = ['-o', '${executableFile}'];
    largs.addAll(args);
    largs.add('$relocatableFile');

    _print('\t\t\$ $linker ${largs.join(" ")}');
    var results = await Process.run(linker, largs);
    print(results.stderr);
    if (setExecutableAttrib) {
      results = await Process.run('chmod', ['+x', executableFile]);
    }
    _print(' ${_success("done")}\n');
  }

  void run({List<String> args}) async {
    _print(_info('Running...'));

    args ??= [];
    _print('\t\t\$ ./$executableFile ${args.join("")}\n');
    var results = await Process.run('./$executableFile', args);
    print(results.stdout);
    print(results.stderr);
    _print(' ${_success("done")}\n');
  }

  void writeCommand(String a) {
    text += '\t$a\n';
  }

  void writeData(String a) {
    data += '\t$a\n';
  }
}
