import 'package:flutter/foundation.dart';

abstract class CommonStore<T> extends ValueNotifier<T> {
  CommonStore(super.value);

  void emit(T newState) => value = newState;
}
