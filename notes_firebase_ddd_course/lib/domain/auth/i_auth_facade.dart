import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notes_firebase_ddd_course/domain/auth/auth_failure.dart';
import 'package:notes_firebase_ddd_course/domain/auth/email_address.dart';
import 'package:notes_firebase_ddd_course/domain/auth/password.dart';

import 'package:notes_firebase_ddd_course/domain/core/value_objects.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
  @required EmailAddress emailAddress,
  @required Password password });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
  @required EmailAddress emailAddress,
  @required Password password });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}