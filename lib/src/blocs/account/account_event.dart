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