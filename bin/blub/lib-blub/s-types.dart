import 'context.dart';
import 's-values.dart';

class V {
  S location;
  ProgramContext context;

  V(this.context, this.location);
}

class VInt extends V {
  VInt(ProgramContext context, S location) : super(context, location);

  VInt operator +(V other) {
    S sum = SRegister(context, ERegister.eax);

    return VInt(context, sum);
  }
}

class VPointer<T> extends VInt {
  VPointer(ProgramContext context, S location) : super(context, location);
}
