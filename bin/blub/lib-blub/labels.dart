import 'lib-blub.dart';
import 's-values.dart';

class LabelManager extends ProgramLib {
  int globalLabelCounter = 0;
  int globalDataLabelCounter = 0;

  LabelManager(ProgramContext ctx) : super(ctx);

  SDataLabel unique_label([String s]) => SDataLabel(
        ((s == null) ? '' : '${s}_') + '${globalLabelCounter++}',
      );

  SDataLabel unique_data_label([String s]) => SDataLabel(
        ((s == null) ? '' : '${s}_') + '${globalDataLabelCounter++}',
      );

  SDataLabelWithLen static_text_to_labels(String text) {
    var label = unique_data_label('print_static');
    var label_len = SDataLabel(label.name + '_len');
    ctx.assembler.DATA('$label db \"$text\"');
    ctx.assembler.DATA('$label_len equ \$-$label');
    return SDataLabelWithLen(
      name: label.toString(),
      len_name: label_len.toString(),
    );
  }
}
