import 'globals.dart';
import 's-values.dart';

int globalLabelCounter = 0;
int globalDataLabelCounter = 0;

SDataLabel unique_label([String s]) => SDataLabel(
      ((s == null) ? '' : '${s}_') + '${globalLabelCounter++}',
    );

SDataLabel unique_data_label([String s]) => SDataLabel(
      ((s == null) ? '' : '${s}_') + '${globalDataLabelCounter++}',
    );

SDataLabelWithLen static_text_to_labels(String text) {
  var label = unique_data_label('print_static');
  var label_len = SDataLabel(label.name + '_len');
  DATA('$label db \"$text\"');
  DATA('$label_len equ \$-$label');
  return SDataLabelWithLen(
    name: label.toString(),
    len_name: label_len.toString(),
  );
}
