import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class ValueObject {
  const ValueObject();

  Either<ValueFailure<T>, T> value;

  @override
  String toString() => 'EmailAddress(value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> &&
      o.value == value;
  }

  @override
  int get hashCode => value.hashCode;


}