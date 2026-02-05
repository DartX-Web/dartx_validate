import 'package:dartx_validate/dartx_validate.dart';

class Unique implements Validator<List> {
  const Unique();

  @override
  bool validate(List value) {
    final uniqueItems = value.toSet();
    return uniqueItems.length == value.length;
  }

  @override
  String get errorMessage => 'List must contain unique items';
}
