import 'package:checkin/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Master extends Equatable {
  final String name;
  final String imageUrl;
  //TODO: this should not be used here, remove ASAP
  final String email;

  Master({
    @required this.name,
    @required this.imageUrl,
    @required this.email,
  }) : super([name, imageUrl, email]);

  factory Master.fromUser( User user ) {
    return Master(name: user.name, imageUrl: user.imageUrl, email: user.email);
  }

  @override
  String toString() {
    return 'Master{name: $name, imageUrl: $imageUrl, email: $email}';
  }


}
