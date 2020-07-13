import 'context.dart';

abstract class S {
  ProgramContext context;
  S(this.context);

  @override
  String toString();
}

class SLiteral extends S {
  dynamic value;

  SLiteral(ProgramContext context, this.value) : super(context);

  @override
  String toString() {
    return value.toString();
  }
}

class SOffset extends S {
  S base;
  S offset;
  bool subract;

  SOffset(context, {this.base, this.offset, this.subract = false})
      : super(context);

  @override
  String toString() {
    return '${base.toString()} ${subract ? "-" : "+"} ${offset.toString()}';
  }
}

class SMemory extends S {
  S expression;

  SMemory(context, this.expression) : super(context);

  @override
  String toString() {
    return '[ ${expression.toString()} ]';
  }
}

enum ERegister { eax, ebx, ecx, edx, rbp }

extension ToName on ERegister {
  String toName() {
    return toString().split('.').last;
  }
}

class SRegister extends S {
  ERegister register;

  SRegister(context, this.register) : super(context) {}

  @override
  String toString() {
    return register.toName();
  }
}

class SDataLabel extends S {
  String name;

  SDataLabel(context, this.name) : super(context);

  @override
  String toString() {
    return name;
  }
}

class SDataLabelWithLen extends SDataLabel {
  String len_name;

  SDataLabelWithLen(context, {name, this.len_name}) : super(context, name);

  String toLenString() {
    return len_name;
  }

  SDataLabel toDataLabel() {
    return SDataLabel(context, name);
  }

  SDataLabel toLenLabel() {
    return SDataLabel(context, len_name);
  }
}
