// This serializes each entry as a unique `int` value.
import 'package:flutter/services.dart';

import '../../../common_path.dart';
import '../../../core/enums/common_enums.dart';


class RestorableDatePickerEntryModeClass
    extends RestorableValue<DatePickerEntryModeClass> {
  RestorableDatePickerEntryModeClass(
      DatePickerEntryModeClass defaultValue,
      ) : _defaultValue = defaultValue;

  final DatePickerEntryModeClass _defaultValue;

  @override
  DatePickerEntryModeClass createDefaultValue() => _defaultValue;

  @override
  void didUpdateValue(DatePickerEntryModeClass? oldValue) {
    assert(debugIsSerializableForRestoration(value.index));
    notifyListeners();
  }

  @override
  DatePickerEntryModeClass fromPrimitives(Object? data) =>
      DatePickerEntryModeClass.values[data! as int];

  @override
  Object? toPrimitives() => value.index;
}