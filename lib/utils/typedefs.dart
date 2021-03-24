import 'package:flutter/material.dart';

typedef OnPressed = void Function();
typedef OnChanged<T> = void Function(T value);
typedef OnChangedAsync<T> = Future<void> Function(T value);
typedef OnValidate<T> = String Function(T value);
typedef ItemBuilder = Widget Function(BuildContext context, int index);
