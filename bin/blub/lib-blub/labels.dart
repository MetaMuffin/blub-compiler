import 'context.dart';
import 'lib-blub.dart';
import 's-values.dart';

class LabelManager extends ProgramLib {
  int globalLabelCounter = 0;
  int globalDataLabelCounter = 0;

  LabelManager(ProgramLibraries context) : super(context);

  SDataLabel unique_label([String s]) => SDataLabel(
        lib,
        ((s == null) ? '' : '${s}_') + '${globalLabelCounter++}',
      );

  SDataLabel unique_data_label([String s]) => SDataLabel(
        lib,
        ((s == null) ? '' : '${s}_') + '${globalDataLabelCounter++}',
      );

  SDataLabelWithLen static_text_to_labels(String text) {
    var label = unique_data_label('print_static');
    var label_len = SDataLabel(lib, label.name + '_len');
    lib.assembler.DATA('$label db \"$text\"');
    lib.assembler.DATA('$label_len equ \$-$label');
    return SDataLabelWithLen(
      lib,
      name: label.toString(),
      len_name: label_len.toString(),
    );
  }
}
