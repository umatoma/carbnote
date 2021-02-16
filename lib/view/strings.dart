import 'package:carbnote/models/exception_model.dart';
import 'package:carbnote/models/record_model.dart';

class CnStr {
  static String recordTimeType(RecordTimeType type) {
    switch (type) {
      case RecordTimeType.breakfast:
        return '朝食';
      case RecordTimeType.lunch:
        return '昼食';
      case RecordTimeType.dinner:
        return '夕食';
      case RecordTimeType.snack:
        return '間食';
      default:
        throw AppException('${type?.toString()}の処理がありません');
    }
  }
}
