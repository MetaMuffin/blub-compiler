abstract class S {
  @override
  String toString();
}

class SLiteral extends S {
  dynamic value;

  SLiteral(this.value);

  @override
  String toString() {
    return value.toString();
  }
}

class SOffset extends S {
  S base;
  S offset;
  bool subract;

  SOffset({this.base, this.offset, this.subract = false});

  @override
  String toString() {
    return '${base.toString()} ${subract ? "-" : "+"} ${offset.toString()}';
  }
}

class SMemory extends S {
  S expression;

  SMemory(this.expression);

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

  SRegister(this.register);

  @override
  String toString() {
    return register.toName();
  }
}

class SDataLabel extends S {
  String name;

  SDataLabel(this.name);

  @override
  String toString() {
    return name;
  }
}

class SDataLabelWithLen extends SDataLabel {
  String len_name;

  SDataLabelWithLen({name, this.len_name}) : super(name);

  String toLenString() {
    return len_name;
  }

  SDataLabel toDataLabel() {
    return SDataLabel(name);
  }

  SDataLabel toLenLabel() {
    return SDataLabel(len_name);
  }
}
