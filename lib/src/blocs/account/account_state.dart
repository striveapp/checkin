import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {
  @override
  String toString() => 'AccountInitial';
}

class AccountLoaded extends AccountState {
  final User user;

  AccountLoaded({required this.user});

  @override
  List<Object> get props => [user];

  String toString() => 'AccountLoaded';
}

class AccountError extends AccountState {
  final String errorMessage;

  AccountError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  String toString() => 'AccountError';
}
