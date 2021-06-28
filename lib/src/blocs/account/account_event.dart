// @dart=2.9

import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountUpdated extends AccountEvent {
  final User user;

  AccountUpdated({this.user});

  @override
  List<Object> get props => [user];

  String toString() => 'AccountUpdated';
}

class AccountDisplayError extends AccountEvent {
  final String errorMessage;

  AccountDisplayError({this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  String toString() => 'AccountDisplayError';
}
