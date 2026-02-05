import 'dart:mirrors';

import 'package:dartx_validate/dartx_validate.dart';

bool validate(Object obj) {
  final instanceMirror = reflect(obj);

  final declarations = instanceMirror.type.declarations.values
      .whereType<VariableMirror>();

  for (var decl in declarations) {
    final fieldValue = instanceMirror.getField(decl.simpleName).reflectee;

    final validators = decl.metadata
        .map((meta) => meta.reflectee)
        .whereType<Validator>();

    for (var validator in validators) {
      if (!validator.validate(fieldValue)) {
        return false;
      }
    }
  }

  return true;
}
